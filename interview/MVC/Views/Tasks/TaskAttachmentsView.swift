//
//  TaskAttachmentsView.swift
//  interview
//
//  Created by Anh Kiet on 20/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

class TaskAttachmentsView: UIView {
    
    // MARK: Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .appColor(.text)
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.text = "ATTACHMENTS"
        
        return label
    }()
    
    private lazy var fileView1: UIButton = {
        var config: UIButton.Configuration = .filled()
        config.image = UIImage(
            systemName: "doc",
            withConfiguration: UIImage.SymbolConfiguration(scale: .small)
        )?.withRenderingMode(.alwaysTemplate)
        config.contentInsets = .init(top: 6, leading: 10, bottom: 6, trailing: 10)
        config.imagePadding = 4
        config.baseForegroundColor = .appColor(.primary)
        config.baseBackgroundColor = .appColor(.container)
        config.attributedTitle = .init(
            "EMDF_Brief.pdf",
            attributes: .init(
                Helper.attributes(
                    font: .systemFont(ofSize: 14, weight: .medium),
                    textColor: .appColor(.text)
                )
            )
        )
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = false
        
        return button
    }()
    
    private lazy var fileView2: UIButton = {
        var config: UIButton.Configuration = .filled()
        config.image = UIImage(
            systemName: "doc",
            withConfiguration: UIImage.SymbolConfiguration(scale: .small)
        )?.withRenderingMode(.alwaysTemplate)
        config.contentInsets = .init(top: 6, leading: 10, bottom: 6, trailing: 10)
        config.imagePadding = 4
        config.baseForegroundColor = .appColor(.primary)
        config.baseBackgroundColor = .appColor(.container)
        config.attributedTitle = .init(
            "Branding.pdf",
            attributes: .init(
                Helper.attributes(
                    font: .systemFont(ofSize: 14, weight: .medium),
                    textColor: .appColor(.text)
                )
            )
        )
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = false
        
        return button
    }()
    
    private lazy var plusView: UIButton = {
        var config: UIButton.Configuration = .plain()
        config.image = UIImage(
            systemName: "plus.app"
        )?.withRenderingMode(.alwaysTemplate)
        config.contentInsets = .init(top: 8, leading: 8, bottom: 8, trailing: 8)
        config.baseForegroundColor = .appColor(.primary)
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = false
        
        return button
    }()
    
    // MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Layout
    private func setupView() {
        addSubview(titleLabel)
        addSubview(fileView1)
        addSubview(fileView2)
        addSubview(plusView)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            fileView1.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor, constant: 20
            ),
            fileView1.leadingAnchor.constraint(equalTo: leadingAnchor),
            fileView1.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            fileView2.leadingAnchor.constraint(
                equalTo: fileView1.trailingAnchor, constant: 8
            ),
            fileView2.centerYAnchor.constraint(equalTo: fileView1.centerYAnchor),
            
            plusView.leadingAnchor.constraint(
                equalTo: fileView2.trailingAnchor, constant: 8
            ),
            plusView.centerYAnchor.constraint(equalTo: fileView1.centerYAnchor)
        ])
    }
}
