//
//  TaskDetailViewController.swift
//  interview
//
//  Created by Anh Kiet on 19/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

class TaskDetailViewController: BaseViewController {
    
    // MARK: Properties
    private lazy var moreButton: UIButton = {
        var config: UIButton.Configuration = .plain()
        config.image = UIImage(systemName: "ellipsis.circle")?
            .withRenderingMode(.alwaysTemplate)
        config.contentInsets = .init(top: 8, leading: 8, bottom: 8, trailing: 8)
        config.baseForegroundColor = .appColor(.text)
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.showsMenuAsPrimaryAction = true
        button.menu = UIMenu(options: [], children: [
            editItem, deleteItem
        ])
        
        return button
    }()
    
    private lazy var editItem = UIAction(
        title: "Edit",
        image: UIImage(
            systemName: "square.and.pencil",
            withConfiguration: UIImage.SymbolConfiguration(scale: .small)
        )?.withRenderingMode(.alwaysTemplate)
    ) { [weak self] (_) in
        guard let this = self else { return }
        AlertManager.alert(title: "Alert", message: "Edit task feature!")
    }
    
    private lazy var deleteItem = UIAction(
        title: "Delete",
        image: UIImage(
            systemName: "trash",
            withConfiguration: UIImage.SymbolConfiguration(scale: .small)
        )?.withRenderingMode(.alwaysTemplate)
    ) { [weak self] (_) in
        AlertManager.alert(title: "Alert", message: "Delete task feature!")
    }
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        
        return scrollView
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        
        return label
    }()
    
    private let userImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "avatar"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.layer.borderColor = UIColor.appColor(.text).cgColor
        imageView.layer.borderWidth = 1
        
        return imageView
    }()
    
    private let createByLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .appColor(.subtext)
        label.font = .systemFont(ofSize: 11, weight: .regular)
        
        return label
    }()
    
    private let createAtLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .appColor(.subtext)
        label.font = .systemFont(ofSize: 11, weight: .bold)
        
        return label
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
    
    private lazy var priorityView: UIButton = {
        var config: UIButton.Configuration = .plain()
        config.image = UIImage(
            systemName: "flag.fill",
            withConfiguration: UIImage.SymbolConfiguration(scale: .small)
        )?.withRenderingMode(.alwaysTemplate)
        config.contentInsets = .init(top: 4, leading: 4, bottom: 4, trailing: 4)
        config.imagePadding = 4
        config.baseForegroundColor = .appColor(.subtext)
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = false
        
        return button
    }()
    
    private let startDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .appColor(.subtext)
        label.font = .systemFont(ofSize: 10, weight: .bold)
        
        return label
    }()
    
    private let progressBarView: UIProgressView = {
        let view = UIProgressView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.progressTintColor = .appColor(.primary)
        view.trackTintColor = .appColor(.primary).withAlphaComponent(0.32)
        view.clipsToBounds = true
        view.layer.cornerRadius = 3
        
        return view
    }()
    
    private let endDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .appColor(.subtext)
        label.font = .systemFont(ofSize: 10, weight: .bold)
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        
        return label
    }()
    
    private let subTaskView: SubTaskView = {
        let view = SubTaskView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let attachmentsView: TaskAttachmentsView = {
        let view = TaskAttachmentsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let mediaView: TaskMediaView = {
        let view = TaskMediaView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let statusUpdatesView: TaskStatusUpdatesView = {
        let view = TaskStatusUpdatesView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let task: TaskModel
    
    // MARK: Initialization
    init(with task: TaskModel) {
        self.task = task
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRightBarButtonItem(moreButton)
        setupView()
        setupData()
    }
    
    // MARK: Layout
    private func setupView() {
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        containerView.addSubview(titleLabel)
        
        containerView.addSubview(statusView)
        
        containerView.addSubview(userImageView)
        containerView.addSubview(createByLabel)
        containerView.addSubview(createAtLabel)
        
        containerView.addSubview(priorityView)
        containerView.addSubview(startDateLabel)
        containerView.addSubview(progressBarView)
        containerView.addSubview(endDateLabel)
        
        containerView.addSubview(descriptionLabel)
        
        containerView.addSubview(subTaskView)

        containerView.addSubview(attachmentsView)
        
        containerView.addSubview(mediaView)
        
        containerView.addSubview(statusUpdatesView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: navigationBarView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            containerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            
            titleLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor, constant: 16
            ),
            titleLabel.topAnchor.constraint(
                equalTo: containerView.topAnchor, constant: 16
            ),
            titleLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor, constant: -16
            ),
            
            statusView.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor, constant: 4
            ),
            statusView.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor, constant: -16
            ),
            
            userImageView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor, constant: 16
            ),
            userImageView.topAnchor.constraint(
                equalTo: statusView.bottomAnchor, constant: 4
            ),
            userImageView.widthAnchor.constraint(equalToConstant: 20),
            userImageView.heightAnchor.constraint(equalToConstant: 20),
            
            createByLabel.leadingAnchor.constraint(
                equalTo: userImageView.trailingAnchor, constant: 4
            ),
            createByLabel.centerYAnchor.constraint(
                equalTo: userImageView.centerYAnchor
            ),
            
            createAtLabel.leadingAnchor.constraint(
                equalTo: createByLabel.trailingAnchor, constant: 2
            ),
            createAtLabel.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor),
            
            priorityView.topAnchor.constraint(
                equalTo: userImageView.bottomAnchor, constant: 12
            ),
            priorityView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor, constant: 16
            ),
            
            startDateLabel.leadingAnchor.constraint(
                equalTo: priorityView.trailingAnchor, constant: 8
            ),
            startDateLabel.centerYAnchor.constraint(equalTo: priorityView.centerYAnchor),
            
            progressBarView.leadingAnchor.constraint(
                equalTo: startDateLabel.trailingAnchor, constant: 8
            ),
            progressBarView.centerYAnchor.constraint(equalTo: priorityView.centerYAnchor),
            progressBarView.heightAnchor.constraint(equalToConstant: 6),
            
            endDateLabel.leadingAnchor.constraint(
                equalTo: progressBarView.trailingAnchor, constant: 8
            ),
            endDateLabel.centerYAnchor.constraint(equalTo: priorityView.centerYAnchor),
            endDateLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor, constant: -16
            ),
            
            descriptionLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor, constant: 16
            ),
            descriptionLabel.topAnchor.constraint(
                equalTo: priorityView.bottomAnchor, constant: 12
            ),
            descriptionLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor, constant: -16
            ),
            
            subTaskView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor, constant: 16
            ),
            subTaskView.topAnchor.constraint(
                equalTo: descriptionLabel.bottomAnchor, constant: 24
            ),
            subTaskView.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor, constant: -16
            ),
            
            attachmentsView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor, constant: 16
            ),
            attachmentsView.topAnchor.constraint(
                equalTo: subTaskView.bottomAnchor, constant: 24
            ),
            attachmentsView.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor, constant: -16
            ),
            
            mediaView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor, constant: 16
            ),
            mediaView.topAnchor.constraint(
                equalTo: attachmentsView.bottomAnchor, constant: 24
            ),
            mediaView.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor, constant: -16
            ),
            
            statusUpdatesView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor, constant: 16
            ),
            statusUpdatesView.topAnchor.constraint(
                equalTo: mediaView.bottomAnchor, constant: 24
            ),
            statusUpdatesView.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor, constant: -16
            ),
            statusUpdatesView.bottomAnchor.constraint(
                equalTo: containerView.bottomAnchor, constant: -12
            )
        ])
    }
    
    private func setupData() {
        titleLabel.attributedText = .init(
            string: task.title,
            attributes: Helper.attributes(
                font: .systemFont(ofSize: 30, weight: .bold),
                textColor: .appColor(.text), lineHeight: 36
            )
        )
        
        setStatus(task.status)
        
        createByLabel.text = "Created by DAKiet"
        createAtLabel.text = "Sep 18 at 12:36 pm"
        
        setPriority(task.priority)
        
        descriptionLabel.attributedText = .init(
            string: task.description,
            attributes: Helper.attributes(
                font: .systemFont(ofSize: 14, weight: .regular),
                textColor: .appColor(.subtext), lineHeight: 20
            )
        )
        
        startDateLabel.text = "Sep 18"
        progressBarView.progress = 0.5
        endDateLabel.text = "Sep 28"
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
    
    private func setPriority(_ priority: TaskModel.Priority) {
        switch priority {
        case .urgent:
            priorityView.configuration?.baseForegroundColor = .Red.r1
            progressBarView.progressTintColor = .Red.r1
            progressBarView.trackTintColor = .Red.r1.withAlphaComponent(0.32)
        case .high:
            priorityView.configuration?.baseForegroundColor = .Yellow.y2
            progressBarView.progressTintColor = .Yellow.y2
            progressBarView.trackTintColor = .Yellow.y2.withAlphaComponent(0.32)
        case .normal:
            priorityView.configuration?.baseForegroundColor = .appColor(.primary)
            progressBarView.progressTintColor = .appColor(.primary)
            progressBarView.trackTintColor = .appColor(.primary).withAlphaComponent(0.32)
        case .low:
            priorityView.configuration?.baseForegroundColor = .appColor(.subtext)
            progressBarView.progressTintColor = .appColor(.subtext)
            progressBarView.trackTintColor = .appColor(.subtext).withAlphaComponent(0.32)
        }
    }
}
