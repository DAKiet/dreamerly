//
//  SettingAboutTableViewCell.swift
//  interview
//
//  Created by Anh Kiet on 17/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

class SettingAboutTableViewCell: UITableViewCell {
    
    // MARK: Properties
    private lazy var logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(.init(
            string: "setting_logout".localized(),
            attributes: Helper.attributes(
                font: .systemFont(ofSize: 16, weight: .bold),
                textColor: .appColor(.text),
                lineHeight: 20
            )
        ), for: .normal)
        button.clipsToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.appColor(.text).cgColor
        button.layer.cornerRadius = 8
        button.addTarget(self,
                         action: #selector(didFinishTouchingLogout(_:)),
                         for: .touchUpInside)
        
        return button
    }()
    
    private let versionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.attributedText = .init(
            string: "setting_info_app".localized(Constant.appVersion, Constant.appName),
            attributes: Helper.attributes(
                font: .systemFont(ofSize: 12, weight: .regular),
                textColor: .appColor(.text),
                lineHeight: 18, textAlignment: .center
            )
        )
        
        return label
    }()
    
    // MARK: Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Layout
    private func setupView() {
        selectionStyle = .none
        backgroundColor = .clear
        
        contentView.addSubview(logoutButton)
        contentView.addSubview(versionLabel)
        
        NSLayoutConstraint.activate([
            logoutButton.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: 16
            ),
            logoutButton.topAnchor.constraint(
                equalTo: contentView.topAnchor, constant: 8
            ),
            logoutButton.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -16
            ),
            logoutButton.heightAnchor.constraint(equalToConstant: 44),
            
            versionLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: 16
            ),
            versionLabel.topAnchor.constraint(
                equalTo: logoutButton.bottomAnchor, constant: 16
            ),
            versionLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -16
            ),
            versionLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor, constant: -16
            )
        ])
    }
    
    // MARK: Handle actions
    @objc private func didFinishTouchingLogout(_ sender: UIButton) {
        AlertManager.alert(title: "Alert", message: "Logout feature!")
    }
}
