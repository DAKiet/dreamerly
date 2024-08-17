//
//  SettingAppTableViewCell.swift
//  interview
//
//  Created by Anh Kiet on 17/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

class SettingAppTableViewCell: UITableViewCell {
    
    // MARK: Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = .appColor(.text)
        label.text = "setting_app_settings".localized()
        
        return label
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appColor(.container)
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0
        
        return stackView
    }()
    
    // Theme
    private let themeContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let themeImageView: UIImageView = {
        let image = UIImage(systemName: "moon.stars")?
            .withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .appColor(.text)
        
        return imageView
    }()
    
    private let themeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.attributedText = .init(
            string: "Dark Mode",
            attributes: Helper.attributes(
                font: .systemFont(ofSize: 14, weight: .regular),
                textColor: .appColor(.text)
            )
        )
        
        return label
    }()
    
    private lazy var themeSwitch: UISwitch = {
        let control = UISwitch()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.onTintColor = .appColor(.primary)
        control.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        control.addTarget(self,
                          action: #selector(darkModeSwitchValueChanged(_:)),
                          for: .valueChanged)
        
        return control
    }()
    
    private let themeLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appColor(.background)
        
        return view
    }()
    
    // Language
    private let languageContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let languageImageView: UIImageView = {
        let image = UIImage(systemName: "globe.asia.australia.fill")?
            .withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .appColor(.text)
        
        return imageView
    }()
    
    private let languageTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .appColor(.text)
        label.text = "setting_language".localized()
        label.setContentHuggingPriority(
            .init(rawValue: 600), for: .horizontal
        )
        label.setContentCompressionResistancePriority(
            .init(rawValue: 600), for: .horizontal
        )
        
        return label
    }()
    
    private let languageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .appColor(.text)
        label.text = Localize.shared.currentLanguage().description
        
        return label
    }()
    
    private lazy var languageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self,
                         action: #selector(didFinishTouchingTranslate(_:)),
                         for: .touchUpInside)
        
        return button
    }()
    
    private let languageNextImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "ic_next")?
            .withRenderingMode(.alwaysTemplate))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .appColor(.text)
        
        return imageView
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
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(containerView)
        
        containerView.addSubview(stackView)
        stackView.addArrangedSubview(themeContainerView)
        stackView.addArrangedSubview(languageContainerView)
        
        themeContainerView.addSubview(themeImageView)
        themeContainerView.addSubview(themeLabel)
        themeContainerView.addSubview(themeSwitch)
        themeContainerView.addSubview(themeLineView)
        
        languageContainerView.addSubview(languageImageView)
        languageContainerView.addSubview(languageTitleLabel)
        languageContainerView.addSubview(languageLabel)
        languageContainerView.addSubview(languageNextImageView)
        languageContainerView.addSubview(languageButton)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: 16
            ),
            titleLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor, constant: 8
            ),
            
            containerView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: 16
            ),
            containerView.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor, constant: 8
            ),
            containerView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -16
            ),
            containerView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor, constant: -8
            ),
            
            stackView.topAnchor.constraint(
                equalTo: containerView.topAnchor, constant: 8
            ),
            stackView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor, constant: 16
            ),
            stackView.bottomAnchor.constraint(
                equalTo: containerView.bottomAnchor, constant: -8
            ),
            stackView.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor, constant: -16
            ),
            
            themeImageView.topAnchor.constraint(
                equalTo: themeContainerView.topAnchor, constant: 16
            ),
            themeImageView.leadingAnchor.constraint(equalTo: themeContainerView.leadingAnchor),
            themeImageView.widthAnchor.constraint(equalToConstant: 24),
            themeImageView.heightAnchor.constraint(equalToConstant: 24),
            
            themeLabel.centerYAnchor.constraint(equalTo: themeContainerView.centerYAnchor),
            themeLabel.leadingAnchor.constraint(
                equalTo: themeImageView.trailingAnchor, constant: 8
            ),
            
            themeSwitch.leadingAnchor.constraint(
                greaterThanOrEqualTo: themeImageView.trailingAnchor, constant: 8
            ),
            themeSwitch.centerYAnchor.constraint(equalTo: themeContainerView.centerYAnchor),
            themeSwitch.trailingAnchor.constraint(equalTo: themeContainerView.trailingAnchor),
            
            themeLineView.leadingAnchor.constraint(equalTo: themeLabel.leadingAnchor),
            themeLineView.topAnchor.constraint(
                equalTo: themeImageView.bottomAnchor, constant: 16
            ),
            themeLineView.trailingAnchor.constraint(equalTo: themeContainerView.trailingAnchor),
            themeLineView.bottomAnchor.constraint(equalTo: themeContainerView.bottomAnchor),
            themeLineView.heightAnchor.constraint(equalToConstant: 1),
            
            languageButton.leadingAnchor.constraint(equalTo: languageContainerView.leadingAnchor),
            languageButton.topAnchor.constraint(equalTo: languageContainerView.topAnchor),
            languageButton.trailingAnchor.constraint(equalTo: languageContainerView.trailingAnchor),
            languageButton.bottomAnchor.constraint(equalTo: languageContainerView.bottomAnchor),
            
            languageImageView.leadingAnchor.constraint(equalTo: languageContainerView.leadingAnchor),
            languageImageView.centerYAnchor.constraint(equalTo: languageContainerView.centerYAnchor),
            languageImageView.widthAnchor.constraint(equalToConstant: 24),
            languageImageView.heightAnchor.constraint(equalToConstant: 24),
            
            languageTitleLabel.topAnchor.constraint(
                equalTo: languageContainerView.topAnchor, constant: 18
            ),
            languageTitleLabel.leadingAnchor.constraint(
                equalTo: languageImageView.trailingAnchor, constant: 8
            ),
            languageTitleLabel.bottomAnchor.constraint(
                equalTo: languageContainerView.bottomAnchor, constant: -18
            ),
            
            languageLabel.leadingAnchor.constraint(
                greaterThanOrEqualTo: languageTitleLabel.trailingAnchor, constant: 8
            ),
            languageLabel.centerYAnchor.constraint(equalTo: languageTitleLabel.centerYAnchor),
            
            languageNextImageView.leadingAnchor.constraint(equalTo: languageLabel.trailingAnchor, constant: 4),
            languageNextImageView.centerYAnchor.constraint(equalTo: languageContainerView.centerYAnchor),
            languageNextImageView.trailingAnchor.constraint(equalTo: languageContainerView.trailingAnchor),
            languageNextImageView.widthAnchor.constraint(equalToConstant: 24),
            languageNextImageView.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        themeSwitch.isOn = AppSetting.isDarkMode
    }
    
    // MARK: Handle actions
    @objc private func didFinishTouchingTranslate(_ sender: UIButton) {
        Localize.shared.switchLanguage()
        Navigator.showRootViewController()
    }
    
    @objc private func darkModeSwitchValueChanged(_ sender: UISwitch) {
        AppSetting.isDarkMode = sender.isOn
        Navigator.showRootViewController()
    }
}
