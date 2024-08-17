//
//  SettingProfileTableViewCell.swift
//  interview
//
//  Created by Anh Kiet on 17/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

class SettingProfileTableViewCell: UITableViewCell {
    
    // MARK: Properties's
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 16
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalCentering
        
        return stackView
    }()
    
    private let avatarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let userImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "avatar"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 64
        imageView.layer.borderColor = UIColor.appColor(.text).cgColor
        imageView.layer.borderWidth = 1
        
        return imageView
    }()
    
    private let infomationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appColor(.container)
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.attributedText = .init(
            string: "Đoàn Anh Kiệt",
            attributes: Helper.attributes(
                font: .systemFont(ofSize: 18, weight: .bold),
                textColor: .appColor(.text), lineHeight: 26
            )
        )
        
        return label
    }()
    
    private let positionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.attributedText = .init(
            string: "global_member".localized(),
            attributes: Helper.attributes(
                font: .systemFont(ofSize: 14, weight: .regular),
                textColor: .appColor(.subtext)
            )
        )
        
        return label
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appColor(.background)
        
        return view
    }()
    
    private let infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0
        
        return stackView
    }()
    
    private let emailView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let emailImageView: UIImageView = {
        let image = UIImage(systemName: "envelope")?
            .withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .appColor(.text)
        
        return imageView
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.attributedText = .init(
            string: "doananhkiet65@gmail.com",
            attributes: Helper.attributes(
                font: .systemFont(ofSize: 16, weight: .medium),
                textColor: .appColor(.text)
            )
        )
        
        return label
    }()
    
    private let emailLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appColor(.background)
        
        return view
    }()
    
    private let phoneView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let phoneImageView: UIImageView = {
        let image = UIImage(systemName: "phone.circle")?
            .withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .appColor(.text)
        
        return imageView
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.attributedText = .init(
            string: "0938 966 594",
            attributes: Helper.attributes(
                font: .systemFont(ofSize: 16, weight: .medium),
                textColor: .appColor(.text)
            )
        )
        
        return label
    }()
    
    // MARK: Initialization's
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
        
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(avatarView)
        avatarView.addSubview(userImageView)
        
        stackView.addArrangedSubview(infomationView)
        infomationView.addSubview(nameLabel)
        infomationView.addSubview(positionLabel)
        infomationView.addSubview(lineView)
        
        infomationView.addSubview(infoStackView)
        
        infoStackView.addArrangedSubview(emailView)
        emailView.addSubview(emailImageView)
        emailView.addSubview(emailLabel)
        emailView.addSubview(emailLineView)
        
        infoStackView.addArrangedSubview(phoneView)
        phoneView.addSubview(phoneImageView)
        phoneView.addSubview(phoneLabel)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: 16
            ),
            stackView.topAnchor.constraint(
                equalTo: contentView.topAnchor, constant: 24
            ),
            stackView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -16
            ),
            stackView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor, constant: -8
            ),
            
            userImageView.topAnchor.constraint(equalTo: avatarView.topAnchor),
            userImageView.leadingAnchor.constraint(
                greaterThanOrEqualTo: avatarView.leadingAnchor, constant: 16
            ),
            userImageView.centerXAnchor.constraint(equalTo: avatarView.centerXAnchor),
            userImageView.bottomAnchor.constraint(equalTo: avatarView.bottomAnchor),
            userImageView.widthAnchor.constraint(equalToConstant: 128),
            userImageView.heightAnchor.constraint(equalToConstant: 128),
            
            nameLabel.leadingAnchor.constraint(
                equalTo: infomationView.leadingAnchor, constant: 16
            ),
            nameLabel.topAnchor.constraint(
                equalTo: infomationView.topAnchor, constant: 16
            ),
            nameLabel.trailingAnchor.constraint(
                equalTo: infomationView.trailingAnchor, constant: -16
            ),
            
            positionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            positionLabel.leadingAnchor.constraint(
                equalTo: infomationView.leadingAnchor, constant: 16
            ),
            positionLabel.trailingAnchor.constraint(
                equalTo: infomationView.trailingAnchor, constant: -16
            ),
            
            lineView.leadingAnchor.constraint(equalTo: infomationView.leadingAnchor),
            lineView.topAnchor.constraint(
                equalTo: positionLabel.bottomAnchor, constant: 16
            ),
            lineView.trailingAnchor.constraint(equalTo: infomationView.trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1),
            
            infoStackView.leadingAnchor.constraint(
                equalTo: infomationView.leadingAnchor, constant: 16
            ),
            infoStackView.topAnchor.constraint(
                equalTo: lineView.bottomAnchor, constant: 8
            ),
            infoStackView.trailingAnchor.constraint(
                equalTo: infomationView.trailingAnchor, constant: -16
            ),
            infoStackView.bottomAnchor.constraint(
                equalTo: infomationView.bottomAnchor, constant: -16
            ),
            
            emailView.heightAnchor.constraint(equalToConstant: 56),
            
            emailImageView.leadingAnchor.constraint(equalTo: emailView.leadingAnchor),
            emailImageView.centerYAnchor.constraint(equalTo: emailView.centerYAnchor),
            emailImageView.widthAnchor.constraint(equalToConstant: 24),
            emailImageView.heightAnchor.constraint(equalToConstant: 24),
            
            emailLabel.leadingAnchor.constraint(
                equalTo: emailImageView.trailingAnchor, constant: 8
            ),
            emailLabel.centerYAnchor.constraint(equalTo: emailView.centerYAnchor),
            emailLabel.trailingAnchor.constraint(equalTo: emailView.trailingAnchor),
            
            emailLineView.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            emailLineView.topAnchor.constraint(
                equalTo: emailImageView.bottomAnchor, constant: 16
            ),
            emailLineView.trailingAnchor.constraint(equalTo: emailView.trailingAnchor),
            emailLineView.bottomAnchor.constraint(equalTo: emailView.bottomAnchor),
            emailLineView.heightAnchor.constraint(equalToConstant: 1),
            
            phoneView.heightAnchor.constraint(equalToConstant: 56),
            
            phoneImageView.leadingAnchor.constraint(equalTo: phoneView.leadingAnchor),
            phoneImageView.centerYAnchor.constraint(equalTo: phoneView.centerYAnchor),
            phoneImageView.widthAnchor.constraint(equalToConstant: 24),
            phoneImageView.heightAnchor.constraint(equalToConstant: 24),
            
            phoneLabel.leadingAnchor.constraint(
                equalTo: phoneImageView.trailingAnchor, constant: 8
            ),
            phoneLabel.centerYAnchor.constraint(equalTo: phoneView.centerYAnchor),
            phoneLabel.trailingAnchor.constraint(equalTo: phoneView.trailingAnchor)
        ])
    }
    
    // MARK: Handle action
    @objc private func didFinishTouchingChangeAvatar(_ sender: UIButton) {
        AlertManager.alert(title: "Alert", message: "Change avatar feature!")
    }
}
