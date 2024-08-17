//
//  BadgeControlView.swift
//  interview
//
//  Created by Anh Kiet on 17/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

class BadgeControlView: UIView {
    
    // MARK: Properties
    private let badgeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.backgroundColor = .R6
        label.isUserInteractionEnabled = false
        label.isHidden = true
        label.clipsToBounds = true
        label.layer.cornerRadius = 8
        
        return label
    }()
    
    private lazy var button: UIButton = {
        var config: UIButton.Configuration = .plain()
        config.image = image?.withRenderingMode(.alwaysTemplate)
        config.contentInsets = .zero
        config.baseForegroundColor = .appColor(.text)
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let image: UIImage?
    
    var badge: Int = 0 {
        didSet {
            guard badge != oldValue else { return }
            
            if badge > 0 {
                if badge > 9 {
                    badgeLabel.attributedText = .init(
                        string: "9+",
                        attributes: Helper.attributes(
                            font: .systemFont(ofSize: 8, weight: .bold),
                            textColor: .white, textAlignment: .center
                        )
                    )
                } else {
                    badgeLabel.attributedText = .init(
                        string: "\(badge)",
                        attributes: Helper.attributes(
                            font: .systemFont(ofSize: 8, weight: .bold),
                            textColor: .white, textAlignment: .center
                        )
                    )
                }
                
                badgeLabel.isHidden = false
            } else {
                badgeLabel.isHidden = true
            }
        }
    }
    
    // MARK: Initialization
    init(image: UIImage?, frame: CGRect = .zero) {
        self.image = image
        
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Layout
    private func setupView() {
        clipsToBounds = false
        addSubview(button)
        addSubview(badgeLabel)
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.topAnchor.constraint(equalTo: topAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            button.widthAnchor.constraint(equalToConstant: 40),
            button.heightAnchor.constraint(equalToConstant: 40),
            
            badgeLabel.topAnchor.constraint(equalTo: topAnchor),
            badgeLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            badgeLabel.widthAnchor.constraint(equalToConstant: 16),
            badgeLabel.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
    
    func addTarget(_ target: Any?, action: Selector) {
        button.addTarget(target, action: action, for: .touchUpInside)
    }
}
