//
//  BaseViewController.swift
//  interview
//
//  Created by Anh Kiet on 17/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    private enum NavigationBarType {
        case root
        case child
        case present
        case push
    }
    
    // MARK: Properties
    private let statusBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let navigationBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let rightBarItemStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 4
        stackView.setContentHuggingPriority(
            .init(rawValue: 1000), for: .horizontal
        )
        stackView.setContentCompressionResistancePriority(
            .init(rawValue: 1000), for: .horizontal
        )
        
        return stackView
    }()
    
    let navigationTitleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let leftBarItemStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 4
        
        return stackView
    }()
    
    private lazy var dismissButton: UIButton = {
        var config: UIButton.Configuration = .plain()
        config.image = UIImage(named: "ic_close")?.withRenderingMode(.alwaysTemplate)
        config.contentInsets = .init(top: 8, leading: 8, bottom: 8, trailing: 8)
        config.baseForegroundColor = .appColor(.text)
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(
            self,
            action: #selector(dismissViewController),
            for: .touchUpInside)
        
        return button
    }()
    
    private lazy var backBarButton: UIButton = {
        var config: UIButton.Configuration = .plain()
        config.image = UIImage(named: "ic_back")?.withRenderingMode(.alwaysTemplate)
        config.contentInsets = .init(top: 8, leading: 8, bottom: 8, trailing: 8)
        config.baseForegroundColor = .appColor(.text)
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self,
                         action: #selector(popViewController),
                         for: .touchUpInside)
        
        return button
    }()
    
    private var navigationBarType: NavigationBarType = .child
    
    var backgroundColorDefault: UIColor {
        return .appColor(.background)
    }
    
    var navigationBackgroundColor: UIColor {
        return .appColor(.background)
    }
    
    var isNavigationHidden: Bool {
        return false
    }
    
    var isCloseButtonHidden: Bool {
        return false
    }
    
    var navigationTitle: String {
        return ""
    }
    
    var isUserInteractionEnabled: Bool = true {
        didSet {
            view.isUserInteractionEnabled = isUserInteractionEnabled
            
            if let navigationController = self.navigationController as? BaseNavigationController {
                navigationController
                    .interactivePopGestureRecognizer?
                    .delegate = isUserInteractionEnabled ? navigationController : nil
            }
        }
    }
    
    // MARK: Initialization
    deinit {
        NotificationCenter.default.removeObserver(self)
        print("Dealloc \(identifier)")
    }
    
    // MARK: Life cycle
    override func loadView() {
        super.loadView()
        
        overrideUserInterfaceStyle = AppSetting.isDarkMode ? .dark : .light
        
        statusBarView.backgroundColor = navigationBackgroundColor
        navigationBarView.backgroundColor = navigationBackgroundColor
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = backgroundColorDefault
        
        if isBeingPresented {
            navigationBarType = .present
            addStatusBarView()
            
            if modalPresentationStyle == .fullScreen || modalPresentationStyle == .overFullScreen {
                addNavigationView(false)
            } else {
                
            }
        } else {
            if let navigationController = self.navigationController {
                if navigationController.isBeingPresented {
                    navigationBarType = .present
                    
                    view.addSubview(statusBarView)
                    
                    NSLayoutConstraint.activate([
                        statusBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                        statusBarView.topAnchor.constraint(equalTo: view.topAnchor),
                        statusBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                        statusBarView.heightAnchor.constraint(equalToConstant: statusBarHeight)
                    ])
                    
                    if navigationController.modalPresentationStyle == .fullScreen
                        || navigationController.modalPresentationStyle == .overFullScreen {
                        addNavigationView(false)
                    } else {
                        
                    }
                } else {
                    if navigationController.viewControllers.last === self {
                        if navigationController.viewControllers.count < 2 {
                            navigationBarType = .root
                            addStatusBarView()
                            addNavigationView(nil)
                        } else {
                            navigationBarType = .push
                            addStatusBarView()
                            addNavigationView(true)
                        }
                    } else {
                        navigationBarType = .child
                    }
                }
            } else {
                navigationBarType = .present
                addStatusBarView()
                
                if modalPresentationStyle == .fullScreen || modalPresentationStyle == .overFullScreen {
                    addNavigationView(false)
                } else {
                    
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBarView.isHidden = isNavigationHidden
        dismissButton.isHidden = isCloseButtonHidden
    }
    
    // MARK: Layout
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.bringSubviewToFront(navigationBarView)
        view.bringSubviewToFront(statusBarView)
    }
    
    private func addStatusBarView() {
        view.addSubview(statusBarView)
        
        NSLayoutConstraint.activate([
            statusBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            statusBarView.topAnchor.constraint(equalTo: view.topAnchor),
            statusBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            statusBarView.heightAnchor.constraint(equalToConstant: statusBarHeight)
        ])
    }
    
    /*
     isPush == nil => ROOT
     isPush == true => PUSH
     isPush == false => PRESENT
     */
    private func addNavigationView(_ isPush: Bool?) {
        view.addSubview(navigationBarView)
        navigationBarView.addSubview(rightBarItemStackView)
        navigationBarView.addSubview(leftBarItemStackView)
        
        NSLayoutConstraint.activate([
            navigationBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBarView.topAnchor.constraint(equalTo: statusBarView.bottomAnchor),
            navigationBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationBarView.heightAnchor.constraint(equalToConstant: navigationHeight),
            
            rightBarItemStackView.centerYAnchor.constraint(equalTo: navigationBarView.centerYAnchor),
            rightBarItemStackView.trailingAnchor.constraint(equalTo: navigationBarView.trailingAnchor,
                                                            constant: -16),
            
            leftBarItemStackView.leadingAnchor.constraint(equalTo: navigationBarView.leadingAnchor,
                                                          constant: 8),
            leftBarItemStackView.centerYAnchor.constraint(equalTo: navigationBarView.centerYAnchor),
        ])
        
        if let isPush = isPush {
            if isPush {
                leftBarItemStackView.addArrangedSubview(backBarButton)
            } else {
                leftBarItemStackView.addArrangedSubview(dismissButton)
            }
        }
        
        addTitleView()
    }
    
    private func addTitleView() {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 1
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.textColor = .appColor(.text)
        titleLabel.text = navigationTitle
        
        navigationBarView.addSubview(navigationTitleView)
        navigationTitleView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            navigationTitleView.topAnchor.constraint(equalTo: navigationBarView.topAnchor),
            navigationTitleView.centerXAnchor.constraint(equalTo: navigationBarView.centerXAnchor),
            navigationTitleView.bottomAnchor.constraint(equalTo: navigationBarView.bottomAnchor),
            
            titleLabel.centerXAnchor.constraint(equalTo: navigationTitleView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: navigationTitleView.centerYAnchor)
        ])
    }
    
    func setRightBarButtonItem(_ button: UIButton) {
        rightBarItemStackView.addArrangedSubview(button)
    }
    
    func removeRightBarButtonItem(_ button: UIButton) {
        rightBarItemStackView.removeArrangedSubview(button)
    }
    
    func removeAllrightBarItems() {
        rightBarItemStackView.arrangedSubviews.forEach {
            rightBarItemStackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }
    
    func setRightBarButtonItems(_ buttons: [UIButton]) {
        removeAllrightBarItems()
        
        buttons.forEach {
            rightBarItemStackView.addArrangedSubview($0)
        }
    }
}

// MARK: Handle actions
extension BaseViewController {
    
    @objc func dismissViewController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func popViewController() {
        self.navigationController?.popViewController(animated: true)
    }
}
