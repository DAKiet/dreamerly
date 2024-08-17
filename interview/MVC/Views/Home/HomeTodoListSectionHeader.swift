//
//  HomeTodoListSectionHeader.swift
//  interview
//
//  Created by Anh Kiet on 17/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

class HomeTodoListSectionHeader: UIView {
    
    // MARK: Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = .init(
            string: "To do today",
            attributes: Helper.attributes(
                font: .systemFont(ofSize: 18, weight: .regular),
                textColor: .appColor(.text)
            )
        )
        
        return label
    }()
    
    private lazy var seemoreButton: UIButton = {
        let image = UIImage(systemName: "arrow.up.right")?
            .withRenderingMode(.alwaysTemplate)
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.tintColor = .appColor(.text)
        button.addTarget(
            self,
            action: #selector(onPressedSeemore(_:)),
            for: .touchUpInside)
        
        return button
    }()
    
    var completion: (() -> Void)?
    
    // MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: Layout
    private func setupView() {
        addSubview(titleLabel)
        addSubview(seemoreButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: 16
            ),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            seemoreButton.leadingAnchor.constraint(
                greaterThanOrEqualTo: titleLabel.trailingAnchor, constant: 4
            ),
            seemoreButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            seemoreButton.trailingAnchor.constraint(
                equalTo: trailingAnchor, constant: -16
            ),
            seemoreButton.widthAnchor.constraint(equalToConstant: 40),
            seemoreButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    // MARK: Handle actions
    @objc private func onPressedSeemore(_ sender: UIButton) {
        completion?()
    }
}
