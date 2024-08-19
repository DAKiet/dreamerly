//
//  TaskTableViewCell.swift
//  interview
//
//  Created by Anh Kiet on 19/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    // MARK: Properties
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.backgroundColor = .appColor(.container)
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 24
        stackView .axis = .horizontal
        stackView.alignment = .leading
        
        return stackView
    }()
    
    private var dueDateConfig: UIButton.Configuration = {
        var config: UIButton.Configuration = .plain()
        config.image = UIImage(
            systemName: "clock.badge.checkmark",
            withConfiguration: UIImage.SymbolConfiguration(scale: .small)
        )?.withRenderingMode(.alwaysTemplate)
        config.contentInsets = .init(top: 4, leading: 4, bottom: 4, trailing: 4)
        config.imagePadding = 8
        config.baseForegroundColor = .appColor(.subtext)
        config.attributedTitle = .init(
            "--/--/--",
            attributes: .init(
                Helper.attributes(
                    font: .systemFont(ofSize: 10, weight: .regular),
                    textColor: .appColor(.subtext)
                )
            )
        )
        
        return config
    }()
    
    private lazy var dueDateView: UIButton = {
        let button = UIButton(configuration: dueDateConfig)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = false
        
        return button
    }()
    
    private var statusConfig: UIButton.Configuration = {
        var config: UIButton.Configuration = .filled()
        config.image = UIImage(
            systemName: "circle.inset.filled",
            withConfiguration: UIImage.SymbolConfiguration(scale: .small)
        )?.withRenderingMode(.alwaysTemplate)
        config.contentInsets = .init(top: 4, leading: 6, bottom: 4, trailing: 6)
        config.baseForegroundColor = .appColor(.subtext)
        config.baseBackgroundColor = .appColor(.container)
        config.imagePadding = 2
        config.attributedTitle = .init(
            "TODO",
            attributes: .init(
                Helper.attributes(
                    font: .systemFont(ofSize: 10, weight: .regular),
                    textColor: .appColor(.subtext)
                )
            )
        )
        
        return config
    }()
    
    private lazy var statusView: UIButton = {
        let button = UIButton(configuration: statusConfig)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = false
        
        return button
    }()
    
    private var priorityConfig: UIButton.Configuration = {
        var config: UIButton.Configuration = .plain()
        config.image = UIImage(
            systemName: "flag.fill",
            withConfiguration: UIImage.SymbolConfiguration(scale: .small)
        )?.withRenderingMode(.alwaysTemplate)
        config.contentInsets = .init(top: 4, leading: 4, bottom: 4, trailing: 4)
        config.imagePadding = 4
        config.baseForegroundColor = .appColor(.subtext)
        config.attributedTitle = .init(
            "Low",
            attributes: .init(
                Helper.attributes(
                    font: .systemFont(ofSize: 10, weight: .regular),
                    textColor: .appColor(.subtext)
                )
            )
        )
        
        return config
    }()
    
    private lazy var priorityView: UIButton = {
        let button = UIButton(configuration: priorityConfig)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = false
        
        return button
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
        
        contentView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(priorityView)
        containerView.addSubview(dueDateView)
        containerView.addSubview(statusView)
                
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(
                equalTo: contentView.topAnchor, constant: 8
            ),
            containerView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: 16
            ),
            containerView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor, constant: -8
            ),
            containerView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -16
            ),
            
            titleLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor, constant: 16
            ),
            titleLabel.topAnchor.constraint(
                equalTo: containerView.topAnchor, constant: 16
            ),
            titleLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor, constant: -16
            ),
            
            priorityView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor, constant: 16
            ),
            priorityView.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor, constant: 8
            ),
            priorityView.bottomAnchor.constraint(
                equalTo: containerView.bottomAnchor, constant: -8
            ),
            priorityView.heightAnchor.constraint(equalToConstant: 24),
            
            dueDateView.leadingAnchor.constraint(
                equalTo: priorityView.trailingAnchor, constant: 24
            ),
            dueDateView.centerYAnchor.constraint(equalTo: priorityView.centerYAnchor),
            dueDateView.heightAnchor.constraint(equalTo: priorityView.heightAnchor),
            
            statusView.leadingAnchor.constraint(
                equalTo: dueDateView.trailingAnchor, constant: 24
            ),
            statusView.centerYAnchor.constraint(equalTo: priorityView.centerYAnchor),
            statusView.heightAnchor.constraint(equalTo: priorityView.heightAnchor),
        ])
    }
    
    func setupData(_ task: TaskModel) {
        titleLabel.attributedText = .init(
            string: task.title,
            attributes: Helper.attributes(
                font: .systemFont(ofSize: 16, weight: .bold),
                textColor: .appColor(.text), lineHeight: 24
            )
        )
        
        setPriority(task.priority)
        
        dueDateConfig.attributedTitle = .init(
            task.startDate.toString("dd/MM/yy"),
            attributes: .init(
                Helper.attributes(
                    font: .systemFont(ofSize: 10, weight: .regular),
                    textColor: .appColor(.subtext)
                )
            )
        )
        dueDateView.configuration = dueDateConfig
        
        setStatus(task.status)
    }
    
    private func setPriority(_ priority: TaskModel.Priority) {
        switch priority {
        case .urgent:
            priorityConfig.baseForegroundColor = .Red.r1
            priorityConfig.attributedTitle = .init(
                "Urgent",
                attributes: .init(
                    Helper.attributes(
                        font: .systemFont(ofSize: 10, weight: .regular),
                        textColor: .appColor(.subtext)
                    )
                )
            )
        case .high:
            priorityConfig.baseForegroundColor = .Yellow.y2
            priorityConfig.attributedTitle = .init(
                "High",
                attributes: .init(
                    Helper.attributes(
                        font: .systemFont(ofSize: 10, weight: .regular),
                        textColor: .appColor(.subtext)
                    )
                )
            )
        case .normal:
            priorityConfig.baseForegroundColor = .appColor(.primary)
            priorityConfig.attributedTitle = .init(
                "Normal",
                attributes: .init(
                    Helper.attributes(
                        font: .systemFont(ofSize: 10, weight: .regular),
                        textColor: .appColor(.subtext)
                    )
                )
            )
        case .low:
            priorityConfig.baseForegroundColor = .appColor(.subtext)
            priorityConfig.attributedTitle = .init(
                "Low",
                attributes: .init(
                    Helper.attributes(
                        font: .systemFont(ofSize: 10, weight: .regular),
                        textColor: .appColor(.subtext)
                    )
                )
            )
        }
        
        priorityView.configuration = priorityConfig
    }
    
    private func setStatus(_ status: TaskModel.Status) {
        switch status {
        case .done:
            statusConfig.baseForegroundColor = .Status.TexColor.done
            statusConfig.baseBackgroundColor = .Status.Background.done
            statusConfig.image = UIImage(
                systemName: "checkmark.circle.fill",
                withConfiguration: UIImage.SymbolConfiguration(scale: .small)
            )?.withRenderingMode(.alwaysTemplate)
            statusConfig.attributedTitle = .init(
                "DONE",
                attributes: .init(
                    Helper.attributes(
                        font: .systemFont(ofSize: 10, weight: .regular),
                        textColor: .Status.TexColor.done
                    )
                )
            )
        case .inReview:
            statusConfig.baseForegroundColor = .Status.TexColor.inReview
            statusConfig.baseBackgroundColor = .Status.Background.inReview
            statusConfig.image = UIImage(
                systemName: "circle.inset.filled",
                withConfiguration: UIImage.SymbolConfiguration(scale: .small)
            )?.withRenderingMode(.alwaysTemplate)
            statusConfig.attributedTitle = .init(
                "IN REVIEW",
                attributes: .init(
                    Helper.attributes(
                        font: .systemFont(ofSize: 10, weight: .medium),
                        textColor: .Status.TexColor.inReview
                    )
                )
            )
        case .inProgress:
            statusConfig.baseForegroundColor = .Status.TexColor.inProgress
            statusConfig.baseBackgroundColor = .Status.Background.inProgress
            statusConfig.image = UIImage(
                systemName: "circle.inset.filled",
                withConfiguration: UIImage.SymbolConfiguration(scale: .small)
            )?.withRenderingMode(.alwaysTemplate)
            statusConfig.attributedTitle = .init(
                "IN PROGRESS",
                attributes: .init(
                    Helper.attributes(
                        font: .systemFont(ofSize: 10, weight: .medium),
                        textColor: .Status.TexColor.inProgress
                    )
                )
            )
        case .todo:
            statusConfig.baseForegroundColor = .Status.TexColor.todo
            statusConfig.baseBackgroundColor = .Status.Background.todo
            statusConfig.image = UIImage(
                systemName: "circle.inset.filled",
                withConfiguration: UIImage.SymbolConfiguration(scale: .small)
            )?.withRenderingMode(.alwaysTemplate)
            statusConfig.attributedTitle = .init(
                "TODO",
                attributes: .init(
                    Helper.attributes(
                        font: .systemFont(ofSize: 10, weight: .medium),
                        textColor: .Status.TexColor.todo
                    )
                )
            )
        }
        
        statusView.configuration = statusConfig
    }
}
