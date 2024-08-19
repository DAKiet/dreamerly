//
//  CheckboxView.swift
//  interview
//
//  Created by Anh Kiet on 19/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

class CheckboxView: UIView {
    
    // MARK: Properties
    private let checkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        
        return label
    }()
    
    private var isChecked: Bool {
        didSet {
            checkImageView.image = UIImage(
                systemName: isChecked ? "checkmark.square.fill" : "square"
            )?.withRenderingMode(.alwaysTemplate)
        }
    }
    
    // MARK: Life cycle
    init(with title: String, textColor: UIColor, isChecked: Bool, frame: CGRect = .zero) {
        self.isChecked = isChecked
        
        super.init(frame: frame)
        
        setData(with: title, textColor: textColor, isChecked: isChecked)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Layout
    private func setupView() {
        addSubview(checkImageView)
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            checkImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            checkImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkImageView.widthAnchor.constraint(equalToConstant: 20),
            checkImageView.heightAnchor.constraint(equalToConstant: 20),
            
            titleLabel.leadingAnchor.constraint(
                equalTo: checkImageView.trailingAnchor, constant: 4
            ),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func setData(with title: String, textColor: UIColor, isChecked: Bool) {
        self.isChecked = isChecked
        self.checkImageView.tintColor = textColor
        
        if isChecked {
            titleLabel.attributedText = .init(
                string: title,
                attributes: [
                    .strikethroughStyle: NSUnderlineStyle.single.rawValue,
                    .font: UIFont.systemFont(ofSize: 13, weight: .regular),
                    .foregroundColor: textColor
                ]
            )
        } else {
            titleLabel.attributedText = .init(
                string: title,
                attributes: [
                    .font: UIFont.systemFont(ofSize: 13, weight: .regular),
                    .foregroundColor: textColor
                ]
            )
        }
    }
}
