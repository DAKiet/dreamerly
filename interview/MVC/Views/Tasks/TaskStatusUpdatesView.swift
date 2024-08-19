//
//  TaskStatusUpdatesView.swift
//  interview
//
//  Created by Anh Kiet on 20/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

class TaskStatusUpdatesView: UIView {
    
    // MARK: Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .appColor(.text)
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.text = "STATUS UPDATES"
        
        return label
    }()
    
    private let imageView1: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "avatar"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        
        return imageView
    }()
    
    private let stepLabel1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .appColor(.subtext)
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.text = "Created by DAKiet Sep 18 at 12:36 pm"
        
        return label
    }()
    
    private let imageView2: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "avatar"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        
        return imageView
    }()
    
    private let stepLabel2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .appColor(.subtext)
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.text = "You Changed in Progress Sep 26 at 12:45 am"
        
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
        addSubview(titleLabel)
        
        addSubview(imageView1)
        addSubview(stepLabel1)
        
        addSubview(imageView2)
        addSubview(stepLabel2)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            imageView1.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor, constant: 20
            ),
            imageView1.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView1.widthAnchor.constraint(equalToConstant: 24),
            imageView1.heightAnchor.constraint(equalToConstant: 24),
            
            stepLabel1.leadingAnchor.constraint(
                equalTo: imageView1.trailingAnchor, constant: 8
            ),
            stepLabel1.centerYAnchor.constraint(equalTo: imageView1.centerYAnchor),
            
            imageView2.topAnchor.constraint(
                equalTo: imageView1.bottomAnchor, constant: 16
            ),
            imageView2.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView2.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView2.widthAnchor.constraint(equalToConstant: 24),
            imageView2.heightAnchor.constraint(equalToConstant: 24),
            
            stepLabel2.leadingAnchor.constraint(
                equalTo: imageView2.trailingAnchor, constant: 8
            ),
            stepLabel2.centerYAnchor.constraint(equalTo: imageView2.centerYAnchor)
        ])
    }
}
