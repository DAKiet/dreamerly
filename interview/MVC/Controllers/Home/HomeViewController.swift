//
//  HomeViewController.swift
//  interview
//
//  Created by Anh Kiet on 17/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    enum SectionType: Int, CaseIterable {
        case title
        case widget
        case todoList
    }
    
    var taskCheckList: [TaskModel] = []
    
    // MARK: Properties
    private let titleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let workspacesView: WorkspacesView = {
        let view = WorkspacesView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var notificationView: BadgeControlView = {
        let image = UIImage(systemName: "bell")?
            .withRenderingMode(.alwaysTemplate)
        let view = BadgeControlView(image: image)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.badge = 100
        view.addTarget(self,
                       action: #selector(didFinishTouchingNotification(_:)))
        
        return view
    }()
    
    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .appColor(.background)
        tableView.contentInset.bottom = 16
        tableView.showsVerticalScrollIndicator = false
        tableView.register(HomeTitleTableViewCell.self,
                           forCellReuseIdentifier: HomeTitleTableViewCell.identifier)
        tableView.register(HomeWidgetTableViewCell.self,
                           forCellReuseIdentifier: HomeWidgetTableViewCell.identifier)
        tableView.register(HomeTodoListTableViewCell.self,
                           forCellReuseIdentifier: HomeTodoListTableViewCell.identifier)
        
        return tableView
    }()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .appColor(.background)
        
        setupView()
        taskCheckList = Array(globalData.tasks.prefix(4))
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: Layout
    private func setupView() {
        view.addSubview(titleView)
        titleView.addSubview(workspacesView)
        titleView.addSubview(notificationView)
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleView.topAnchor.constraint(
                equalTo: view.topAnchor, constant: safeAreaInsets.top
            ),
            titleView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            workspacesView.topAnchor.constraint(equalTo: titleView.topAnchor),
            workspacesView.leadingAnchor.constraint(
                equalTo: titleView.leadingAnchor, constant: 16
            ),
            workspacesView.bottomAnchor.constraint(
                equalTo: titleView.bottomAnchor, constant: -8
            ),
            
            notificationView.leadingAnchor.constraint(
                greaterThanOrEqualTo: workspacesView.trailingAnchor, constant: 4
            ),
            notificationView.centerYAnchor.constraint(equalTo: workspacesView.centerYAnchor),
            notificationView.trailingAnchor.constraint(
                equalTo: titleView.trailingAnchor, constant: -16
            ),
            
            tableView.topAnchor.constraint(equalTo: titleView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    // MARK: Handle actions
    @objc private func didFinishTouchingNotification(_ sender: UIButton) {
        Navigator.navigateToNotification(from: self)
    }
}

// MARK: UITableViewDataSource
extension HomeViewController: UITableViewDataSource & UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SectionType.allCases.count
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard
            let sectionType = SectionType(rawValue: section),
            sectionType == .todoList,
            !taskCheckList.isEmpty
        else { return nil }

        return "To do today"
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard
            let sectionType = SectionType(rawValue: section),
            sectionType == .todoList,
            !taskCheckList.isEmpty
        else { return 0 }

        return 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionType = SectionType(rawValue: section) else { return 0 }
        
        switch sectionType {
        case .title:
            return 1
        case .widget:
            return 1
        case .todoList:
            return taskCheckList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sectionType = SectionType(rawValue: indexPath.section) else { return UITableViewCell() }
        
        switch sectionType {
        case .title:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: HomeTitleTableViewCell.identifier, for: indexPath
            ) as! HomeTitleTableViewCell
            
            return cell
        case .widget:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: HomeWidgetTableViewCell.identifier, for: indexPath
            ) as! HomeWidgetTableViewCell
            
            return cell
        case .todoList:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: HomeTodoListTableViewCell.identifier, for: indexPath
            ) as! HomeTodoListTableViewCell
            cell.setData(taskCheckList[indexPath.row])
            
            return cell
        }
    }
}
