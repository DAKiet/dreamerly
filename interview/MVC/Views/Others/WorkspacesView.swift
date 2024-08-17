//
//  WorkspacesView.swift
//  interview
//
//  Created by Anh Kiet on 17/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

class WorkspacesView: UIView {
    
    // MARK: Properties
    private let userImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "avatar"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 24
        imageView.layer.borderColor = UIColor.appColor(.text).cgColor
        imageView.layer.borderWidth = 1
        
        return imageView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        
        return stackView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.attributedText = .init(
            string: "My Workspaces",
            attributes: Helper.attributes(
                font: .systemFont(ofSize: 16, weight: .bold),
                textColor: .appColor(.text)
            )
        )
        label.setContentHuggingPriority(
            .init(rawValue: 605), for: .vertical
        )
        label.setContentCompressionResistancePriority(
            .init(rawValue: 605), for: .vertical
        )
        
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.attributedText = .init(
            string: "Education plans - 4 Members",
            attributes: Helper.attributes(
                font: .systemFont(ofSize: 12, weight: .regular),
                textColor: .appColor(.subtext)
            )
        )
        label.setContentHuggingPriority(
            .init(rawValue: 600), for: .vertical
        )
        label.setContentCompressionResistancePriority(
            .init(rawValue: 600), for: .vertical
        )
        
        return label
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
        addSubview(userImageView)
        
        addSubview(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(
                equalTo: topAnchor, constant: 4
            ),
            userImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            userImageView.bottomAnchor.constraint(
                equalTo: bottomAnchor, constant: -4
            ),
            userImageView.widthAnchor.constraint(equalToConstant: 48),
            userImageView.heightAnchor.constraint(equalToConstant: 48),
            
            stackView.leadingAnchor.constraint(
                equalTo: userImageView.trailingAnchor, constant: 8
            ),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
