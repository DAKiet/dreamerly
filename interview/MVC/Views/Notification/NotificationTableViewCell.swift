//
//  NotificationTableViewCell.swift
//  interview
//
//  Created by Anh Kiet on 19/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    
    // MARK: Properties
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appColor(.container)
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    private lazy var notificationImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo_transparent"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .appColor(.primary)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.setContentHuggingPriority(
            .init(rawValue: 800), for: .horizontal
        )
        label.setContentCompressionResistancePriority(
            .init(rawValue: 800), for: .horizontal
        )
        
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.isUserInteractionEnabled = true
        
        return label
    }()
    
    private let readView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .Red.r6
        view.clipsToBounds = true
        view.layer.cornerRadius = 4
        
        return view
    }()
    
    var isRead: Bool = false {
        didSet {
            readView.isHidden = isRead
        }
    }
    
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
        containerView.addSubview(notificationImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(timeLabel)
        containerView.addSubview(descriptionLabel)
        
        containerView.addSubview(readView)
        
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
            
            notificationImageView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor, constant: 12
            ),
            notificationImageView.topAnchor.constraint(
                equalTo: containerView.topAnchor, constant: 10
            ),
            notificationImageView.widthAnchor.constraint(equalToConstant: 40),
            notificationImageView.heightAnchor.constraint(equalToConstant: 40),
            
            titleLabel.leadingAnchor.constraint(
                equalTo: notificationImageView.trailingAnchor, constant: 8
            ),
            titleLabel.topAnchor.constraint(
                equalTo: containerView.topAnchor, constant: 8
            ),
            
            timeLabel.leadingAnchor.constraint(
                greaterThanOrEqualTo: titleLabel.trailingAnchor, constant: 8
            ),
            timeLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            timeLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor, constant: -12
            ),
            
            descriptionLabel.leadingAnchor.constraint(
                equalTo: notificationImageView.trailingAnchor, constant: 8
            ),
            descriptionLabel.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor, constant: 4
            ),
            descriptionLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor, constant: -12
            ),
            descriptionLabel.bottomAnchor.constraint(
                equalTo: containerView.bottomAnchor, constant: -8
            ),
            
            readView.topAnchor.constraint(
                equalTo: containerView.topAnchor, constant: 4
            ),
            readView.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor, constant: -4
            ),
            readView.widthAnchor.constraint(equalToConstant: 8),
            readView.heightAnchor.constraint(equalToConstant: 8)
        ])
    }
    
    func setupData(_ notification: NotificationModel) {
        isRead = notification.isRead
        titleLabel.attributedText = .init(
            string: notification.title,
            attributes: Helper.attributes(
                font: .systemFont(ofSize: 14, weight: .bold),
                textColor: .appColor(.text), lineHeight: 20
            )
        )
        timeLabel.attributedText = .init(
            string: notification.sentAt,
            attributes: Helper.attributes(
                font: .systemFont(ofSize: 12, weight: .regular),
                textColor: .appColor(.text), lineHeight: 18
            )
        )
        descriptionLabel.attributedText = .init(
            string: notification.body,
            attributes: Helper.attributes(
                font: .systemFont(ofSize: 14, weight: .regular),
                textColor: .appColor(.subtext), lineHeight: 20
            )
        )
    }
}
