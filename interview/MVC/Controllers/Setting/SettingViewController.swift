//
//  SettingViewController.swift
//  interview
//
//  Created by Anh Kiet on 17/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

class SettingViewController: BaseViewController {

    enum SectionType: Int, CaseIterable {
        case profile
        case app
        case security
        case help
        case about
    }
    
    // MARK: Properties
    override var navigationTitle: String {
        return "setting_title".localized()
    }
    
    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .appColor(.background)
        tableView.contentInset.bottom = safeAreaInsets.bottom
        tableView.showsVerticalScrollIndicator = false
        tableView.register(SettingProfileTableViewCell.self,
                           forCellReuseIdentifier: SettingProfileTableViewCell.identifier)
        tableView.register(SettingAppTableViewCell.self,
                           forCellReuseIdentifier: SettingAppTableViewCell.identifier)
        tableView.register(SettingSecurityTableViewCell.self,
                           forCellReuseIdentifier: SettingSecurityTableViewCell.identifier)
        tableView.register(SettingHelpTableViewCell.self,
                           forCellReuseIdentifier: SettingHelpTableViewCell.identifier)
        tableView.register(SettingAboutTableViewCell.self,
                           forCellReuseIdentifier: SettingAboutTableViewCell.identifier)
        tableView.dataSource = self
        
        return tableView
    }()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    // MARK: Layout
    private func setupView() {
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: navigationBarView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

// MARK: UITableViewDataSource
extension SettingViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SectionType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sectionType = SectionType(rawValue: indexPath.section) else { return UITableViewCell() }
        
        switch sectionType {
        case .profile:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingProfileTableViewCell.identifier, for: indexPath
            ) as! SettingProfileTableViewCell
            
            return cell
        case .app:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingAppTableViewCell.identifier, for: indexPath
            ) as! SettingAppTableViewCell
            
            return cell
        case .security:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingSecurityTableViewCell.identifier, for: indexPath
            ) as! SettingSecurityTableViewCell
            
            return cell
        case .help:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingHelpTableViewCell.identifier, for: indexPath
            ) as! SettingHelpTableViewCell
            
            return cell
        case .about:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingAboutTableViewCell.identifier, for: indexPath
            ) as! SettingAboutTableViewCell
            
            return cell
        }
    }
}
