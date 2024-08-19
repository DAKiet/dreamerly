//
//  NotificationViewController.swift
//  interview
//
//  Created by Anh Kiet on 19/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

class NotificationViewController: BaseViewController {
    
    // MARK: Properties
    private lazy var readAllButton: UIButton = {
        var config: UIButton.Configuration = .plain()
        config.image = UIImage(named: "ic_read_all")?.withRenderingMode(.alwaysTemplate)
        config.contentInsets = .init(top: 8, leading: 8, bottom: 8, trailing: 8)
        config.baseForegroundColor = .appColor(.text)
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self,
                         action: #selector(didFinishTouchingReadAll),
                         for: .touchUpInside)
        
        return button
    }()
    
    private lazy var filterButton: UIButton = {
        var config: UIButton.Configuration = .plain()
        config.image = UIImage(named: "ic_filter")?.withRenderingMode(.alwaysTemplate)
        config.contentInsets = .init(top: 8, leading: 8, bottom: 8, trailing: 8)
        config.baseForegroundColor = .appColor(.text)
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self,
                         action: #selector(didFinishTouchingReadAll),
                         for: .touchUpInside)
        
        return button
    }()
    
    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.contentInset.top = 16
        tableView.contentInset.bottom = safeAreaInsets.bottom
        tableView.showsVerticalScrollIndicator = false
        tableView.register(NotificationTableViewCell.self,
                           forCellReuseIdentifier: NotificationTableViewCell.identifier)
        tableView.dataSource = self
        
        return tableView
    }()
    
    override var navigationTitle: String {
        return "notification_title".localized()
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRightBarButtonItems([readAllButton, filterButton])
        setupView()
    }
    
    // MARK: Layout
    private func setupView() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: navigationBarView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    // MARK: Handle action
    @objc private func didFinishTouchingReadAll(_ sender: UIButton) {
        AlertManager.alert(title: "Alert", message: "Read all notifications feature!")
    }
    
    @objc private func didFinishTouchingFilter(_ sender: UIButton) {
        AlertManager.alert(title: "Alert", message: "Filter feature!")
    }
}

// MARK: UITableViewDataSource
extension NotificationViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return globalData.notifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: NotificationTableViewCell.identifier, for: indexPath
        ) as! NotificationTableViewCell
        cell.setupData(globalData.notifications[indexPath.row])
        
        return cell
    }
}
