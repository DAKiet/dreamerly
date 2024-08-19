//
//  SubTaskView.swift
//  interview
//
//  Created by Anh Kiet on 20/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

class SubTaskView: UIView {
    
    // MARK: Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .appColor(.text)
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.text = "SUBTASKS"
        
        return label
    }()
    
    private let taskImageView1: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "avatar"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        
        return imageView
    }()
    
    private let taskTitleLabel1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .appColor(.text)
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.text = "Here image area"
        
        return label
    }()
    
    private let taskDayLabel1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .appColor(.subtext)
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.text = "Wed - Sep 23"
        
        return label
    }()
    
    private let taskImageView2: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "avatar"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        
        return imageView
    }()
    
    private let taskTitleLabel2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .appColor(.text)
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.text = "Last Project Presentation"
        
        return label
    }()
    
    private let taskDayLabel2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .appColor(.subtext)
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.text = "Fry - Sep 25"
        
        return label
    }()
    
    private lazy var plusView: UIButton = {
        var config: UIButton.Configuration = .plain()
        config.image = UIImage(
            systemName: "plus",
            withConfiguration: UIImage.SymbolConfiguration(scale: .small)
        )?.withRenderingMode(.alwaysTemplate)
        config.contentInsets = .init(top: 4, leading: 10, bottom: 4, trailing: 10)
        config.imagePadding = 4
        config.baseForegroundColor = .appColor(.primary)
        config.background.strokeColor = .appColor(.primary)
        config.background.strokeWidth = 1
        config.attributedTitle = .init(
            "Add Subtask",
            attributes: .init(
                Helper.attributes(
                    font: .systemFont(ofSize: 12, weight: .medium),
                    textColor: .appColor(.primary)
                )
            )
        )
        
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
        
        addSubview(taskImageView1)
        addSubview(taskTitleLabel1)
        addSubview(taskDayLabel1)
        
        addSubview(taskImageView2)
        addSubview(taskTitleLabel2)
        addSubview(taskDayLabel2)
        
        addSubview(plusView)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            taskImageView1.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor, constant: 20
            ),
            taskImageView1.leadingAnchor.constraint(equalTo: leadingAnchor),
            taskImageView1.widthAnchor.constraint(equalToConstant: 40),
            taskImageView1.heightAnchor.constraint(equalToConstant: 40),
            
            taskTitleLabel1.leadingAnchor.constraint(
                equalTo: taskImageView1.trailingAnchor, constant: 8
            ),
            taskTitleLabel1.centerYAnchor.constraint(equalTo: taskImageView1.centerYAnchor),
            
            taskDayLabel1.leadingAnchor.constraint(
                equalTo: taskTitleLabel1.trailingAnchor, constant: 16
            ),
            taskDayLabel1.centerYAnchor.constraint(equalTo: taskImageView1.centerYAnchor),
            
            taskImageView2.topAnchor.constraint(
                equalTo: taskImageView1.bottomAnchor, constant: 16
            ),
            taskImageView2.leadingAnchor.constraint(equalTo: leadingAnchor),
            taskImageView2.widthAnchor.constraint(equalToConstant: 40),
            taskImageView2.heightAnchor.constraint(equalToConstant: 40),
            
            taskTitleLabel2.leadingAnchor.constraint(
                equalTo: taskImageView2.trailingAnchor, constant: 8
            ),
            taskTitleLabel2.centerYAnchor.constraint(equalTo: taskImageView2.centerYAnchor),
            
            taskDayLabel2.leadingAnchor.constraint(
                equalTo: taskTitleLabel2.trailingAnchor, constant: 16
            ),
            taskDayLabel2.centerYAnchor.constraint(equalTo: taskImageView2.centerYAnchor),
            
            plusView.topAnchor.constraint(
                equalTo: taskImageView2.bottomAnchor, constant: 16
            ),
            plusView.leadingAnchor.constraint(equalTo: leadingAnchor),
            plusView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
