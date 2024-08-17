//
//  SettingSecurityTableViewCell.swift
//  interview
//
//  Created by Anh Kiet on 17/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

class SettingSecurityTableViewCell: UITableViewCell {
    
    // MARK: Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.attributedText = .init(
            string: "setting_password_security".localized(),
            attributes: Helper.attributes(
                font: .systemFont(ofSize: 12, weight: .bold),
                textColor: .appColor(.text)
            )
        )
        
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
    
    // Change password
    private let passwordContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let passwordImageView: UIImageView = {
        let image = UIImage(systemName: "lock.rotation.open")?
            .withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .appColor(.text)
        
        return imageView
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.attributedText = .init(
            string: "setting_change_password".localized(),
            attributes: Helper.attributes(
                font: .systemFont(ofSize: 14, weight: .regular),
                textColor: .appColor(.text)
            )
        )
        
        return label
    }()
    
    private lazy var passwordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self,
                         action: #selector(didFinishTouchingChangePassword(_:)),
                         for: .touchUpInside)
        
        return button
    }()
    
    private let passwordNextImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "ic_next")?
            .withRenderingMode(.alwaysTemplate))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .appColor(.text)
        
        return imageView
    }()
    
    private let passwordLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appColor(.background)
        
        return view
    }()
    
    // Biometrics
    private let biometricsContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let biometricsImageView: UIImageView = {
        let image = UIImage(systemName: "faceid")?
            .withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .appColor(.text)
        
        return imageView
    }()
    
    private let biometricsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.attributedText = .init(
            string: "setting_face_id".localized(),
            attributes: Helper.attributes(
                font: .systemFont(ofSize: 14, weight: .regular),
                textColor: .appColor(.text)
            )
        )
        
        return label
    }()
    
    private lazy var biometricsSwitch: UISwitch = {
        let control = UISwitch()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.onTintColor = .appColor(.primary)
        control.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        control.addTarget(self,
                          action: #selector(biometricsSwitchValueChanged(_:)),
                          for: .valueChanged)
        
        return control
    }()
    
    private let biometricsLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appColor(.background)
        
        return view
    }()
    
    // Fast login
    private let fastLoginContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let fastLoginImageView: UIImageView = {
        let image = UIImage(systemName: "rectangle.portrait.and.arrow.right")?
            .withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .appColor(.text)
        
        return imageView
    }()
    
    private let fastLoginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.attributedText = .init(
            string: "setting_fast_login".localized(),
            attributes: Helper.attributes(
                font: .systemFont(ofSize: 14, weight: .regular),
                textColor: .appColor(.text)
            )
        )
        
        return label
    }()
    
    private let fastLoginDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.attributedText = .init(
            string: "setting_description_fast_login".localized(),
            attributes: Helper.attributes(
                font: .systemFont(ofSize: 12, weight: .regular),
                textColor: .appColor(.subtext)
            )
        )
        
        return label
    }()
    
    private lazy var fastLoginSwitch: UISwitch = {
        let control = UISwitch()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.onTintColor = .appColor(.primary)
        control.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        control.addTarget(self,
                          action: #selector(fastLoginSwitchValueChanged(_:)),
                          for: .valueChanged)
        
        return control
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
    
        stackView.addArrangedSubview(passwordContainerView)
        stackView.addArrangedSubview(biometricsContainerView)
        stackView.addArrangedSubview(fastLoginContainerView)
        
        passwordContainerView.addSubview(passwordImageView)
        passwordContainerView.addSubview(passwordLabel)
        passwordContainerView.addSubview(passwordButton)
        passwordContainerView.addSubview(passwordNextImageView)
        passwordContainerView.addSubview(passwordLineView)
        
        biometricsContainerView.addSubview(biometricsImageView)
        biometricsContainerView.addSubview(biometricsLabel)
        biometricsContainerView.addSubview(biometricsSwitch)
        biometricsContainerView.addSubview(biometricsLineView)
        
        fastLoginContainerView.addSubview(fastLoginImageView)
        fastLoginContainerView.addSubview(fastLoginLabel)
        fastLoginContainerView.addSubview(fastLoginDescriptionLabel)
        fastLoginContainerView.addSubview(fastLoginSwitch)
        
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
            
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor, constant: 16
            ),
            stackView.bottomAnchor.constraint(
                equalTo: containerView.bottomAnchor, constant: -8
            ),
            stackView.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor, constant: -16
            ),
            
            biometricsImageView.topAnchor.constraint(
                equalTo: biometricsContainerView.topAnchor, constant: 16
            ),
            biometricsImageView.leadingAnchor.constraint(equalTo: biometricsContainerView.leadingAnchor),
            biometricsImageView.widthAnchor.constraint(equalToConstant: 24),
            biometricsImageView.heightAnchor.constraint(equalToConstant: 24),
            
            biometricsLabel.centerYAnchor.constraint(equalTo: biometricsContainerView.centerYAnchor),
            biometricsLabel.leadingAnchor.constraint(
                equalTo: biometricsImageView.trailingAnchor, constant: 8
            ),
            
            biometricsSwitch.leadingAnchor.constraint(
                greaterThanOrEqualTo: biometricsImageView.trailingAnchor, constant: 8
            ),
            biometricsSwitch.centerYAnchor.constraint(equalTo: biometricsContainerView.centerYAnchor),
            biometricsSwitch.trailingAnchor.constraint(equalTo: biometricsContainerView.trailingAnchor),
            
            biometricsLineView.leadingAnchor.constraint(equalTo: biometricsLabel.leadingAnchor),
            biometricsLineView.topAnchor.constraint(
                equalTo: biometricsImageView.bottomAnchor, constant: 16
            ),
            biometricsLineView.trailingAnchor.constraint(equalTo: biometricsContainerView.trailingAnchor),
            biometricsLineView.bottomAnchor.constraint(equalTo: biometricsContainerView.bottomAnchor),
            biometricsLineView.heightAnchor.constraint(equalToConstant: 1),
            
            passwordButton.leadingAnchor.constraint(equalTo: passwordContainerView.leadingAnchor),
            passwordButton.topAnchor.constraint(equalTo: passwordContainerView.topAnchor),
            passwordButton.trailingAnchor.constraint(equalTo: passwordContainerView.trailingAnchor),
            passwordButton.bottomAnchor.constraint(equalTo: passwordContainerView.bottomAnchor),
            
            passwordImageView.topAnchor.constraint(
                equalTo: passwordContainerView.topAnchor, constant: 16
            ),
            passwordImageView.leadingAnchor.constraint(equalTo: passwordContainerView.leadingAnchor),
            passwordImageView.widthAnchor.constraint(equalToConstant: 24),
            passwordImageView.heightAnchor.constraint(equalToConstant: 24),
            
            passwordLabel.centerYAnchor.constraint(equalTo: passwordContainerView.centerYAnchor),
            passwordLabel.leadingAnchor.constraint(
                equalTo: passwordImageView.trailingAnchor, constant: 8
            ),
            
            passwordNextImageView.leadingAnchor.constraint(
                equalTo: passwordLabel.trailingAnchor, constant: 4
            ),
            passwordNextImageView.centerYAnchor.constraint(equalTo: passwordContainerView.centerYAnchor),
            passwordNextImageView.trailingAnchor.constraint(equalTo: passwordContainerView.trailingAnchor),
            passwordNextImageView.widthAnchor.constraint(equalToConstant: 24),
            passwordNextImageView.heightAnchor.constraint(equalToConstant: 24),
            
            passwordLineView.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
            passwordLineView.topAnchor.constraint(
                equalTo: passwordImageView.bottomAnchor, constant: 16
            ),
            passwordLineView.trailingAnchor.constraint(equalTo: passwordContainerView.trailingAnchor),
            passwordLineView.bottomAnchor.constraint(equalTo: passwordContainerView.bottomAnchor),
            passwordLineView.heightAnchor.constraint(equalToConstant: 1),
            
            fastLoginImageView.topAnchor.constraint(
                greaterThanOrEqualTo: fastLoginContainerView.topAnchor, constant: 8
            ),
            fastLoginImageView.leadingAnchor.constraint(equalTo: fastLoginContainerView.leadingAnchor),
            fastLoginImageView.centerYAnchor.constraint(equalTo: fastLoginContainerView.centerYAnchor),
            fastLoginImageView.widthAnchor.constraint(equalToConstant: 24),
            fastLoginImageView.heightAnchor.constraint(equalToConstant: 24),
            
            fastLoginLabel.topAnchor.constraint(
                equalTo: fastLoginContainerView.topAnchor, constant: 12
            ),
            fastLoginLabel.leadingAnchor.constraint(
                equalTo: fastLoginImageView.trailingAnchor, constant: 8
            ),
            
            fastLoginDescriptionLabel.topAnchor.constraint(equalTo: fastLoginLabel.bottomAnchor),
            fastLoginDescriptionLabel.bottomAnchor.constraint(
                equalTo: fastLoginContainerView.bottomAnchor, constant: -12
            ),
            fastLoginDescriptionLabel.leadingAnchor.constraint(equalTo: fastLoginLabel.leadingAnchor),
            
            fastLoginSwitch.leadingAnchor.constraint(
                greaterThanOrEqualTo: fastLoginLabel.trailingAnchor, constant: 8
            ),
            fastLoginSwitch.leadingAnchor.constraint(
                greaterThanOrEqualTo: fastLoginDescriptionLabel.trailingAnchor,
                constant: 8
            ),
            fastLoginSwitch.centerYAnchor.constraint(equalTo: fastLoginContainerView.centerYAnchor),
            fastLoginSwitch.trailingAnchor.constraint(equalTo: fastLoginContainerView.trailingAnchor)
        ])
        
        fastLoginSwitch.isOn = AppSetting.isFastLoginEnabled
        biometricsSwitch.isOn = AppSetting.isBiometricAuthentication
    }
    
    // MARK: Handle actions
    @objc private func biometricsSwitchValueChanged(_ sender: UISwitch) {
        AppSetting.isBiometricAuthentication = sender.isOn
    }
    
    @objc private func didFinishTouchingChangePassword(_ sender: UIButton) {
        AlertManager.alert(title: "Alert", message: "Change password feature!")
    }
    
    @objc private func fastLoginSwitchValueChanged(_ sender: UISwitch) {
        AppSetting.isFastLoginEnabled = sender.isOn
    }
}
