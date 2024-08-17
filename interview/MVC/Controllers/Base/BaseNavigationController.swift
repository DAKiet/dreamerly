//
//  BaseNavigationController.swift
//  interview
//
//  Created by Anh Kiet on 17/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

final class BaseNavigationController: UINavigationController {
    
    // MARK: Properties
    private let backgroundStatusBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    // Indicates if a UIViewController is currently being pushed onto this navigation controller
    private var duringPushAnimation = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return visibleViewController?.preferredStatusBarStyle ?? .lightContent
    }
    
    // MARK: Initialization
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        delegate = nil
        interactivePopGestureRecognizer?.delegate = nil
    }
    
    // MARK: Life cycle's
    override func loadView() {
        super.loadView()
        
        navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self // to track when a view controller is being pushed
        self.interactivePopGestureRecognizer?.delegate = self // for swipe the pop gesture recogniser
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        duringPushAnimation = true
        super.pushViewController(viewController, animated: animated)
    }
    
    func setBackgroundColor(_ color: UIColor) {
        backgroundStatusBarView.backgroundColor = color
        navigationBar.backgroundColor = color
    }
}

// MARK: UINavigationControllerDelegate
extension BaseNavigationController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        duringPushAnimation = false
    }
}

// MARK: UIGestureRecognizerDelegate
extension BaseNavigationController: UIGestureRecognizerDelegate {
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard gestureRecognizer == interactivePopGestureRecognizer else { return true }
        
        return viewControllers.count > 1 && duringPushAnimation == false
    }
}
