//
//  HomeTodoListTableViewCell.swift
//  interview
//
//  Created by Anh Kiet on 17/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

class HomeTodoListTableViewCell: UITableViewCell {
    
    // MARK: Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.attributedText = .init(
            string: "home_title".localized(),
            attributes: Helper.attributes(
                font: .systemFont(ofSize: 32, weight: .bold),
                textColor: .appColor(.text),
                lineHeight: 32, textAlignment: .left
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
        
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: 16
            ),
            titleLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor, constant: 16
            ),
            titleLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -16
            ),
            titleLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor, constant: -16
            )
        ])
    }
}
