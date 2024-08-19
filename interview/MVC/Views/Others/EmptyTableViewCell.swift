//
//  EmptyTableViewCell.swift
//  interview
//
//  Created by Anh Kiet on 19/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

class EmptyTableViewCell: UITableViewCell {
    
    // MARK: Properties
    private let emptyImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "img_empty_data"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.text = "------"
        
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "------"
        
        return label
    }()
    
    // MARK: Life cycle
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
        
        contentView.addSubview(emptyImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            emptyImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            emptyImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            emptyImageView.widthAnchor.constraint(equalToConstant: 112),
            emptyImageView.heightAnchor.constraint(equalToConstant: 112),
            
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.topAnchor.constraint(
                equalTo: emptyImageView.bottomAnchor, constant: 16
            ),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            descriptionLabel.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor, constant: 8
            ),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func setup(title: String, description: String) {
        titleLabel.attributedText = .init(
            string: title,
            attributes: Helper.attributes(
                font: .systemFont(ofSize: 18, weight: .bold),
                textColor: .appColor(.text),
                lineHeight: 26, textAlignment: .center
            )
        )
        descriptionLabel.attributedText = .init(
            string: description,
            attributes: Helper.attributes(
                font: .systemFont(ofSize: 16, weight: .regular),
                textColor: .appColor(.subtext),
                lineHeight: 20, textAlignment: .center
            )
        )
    }
}
