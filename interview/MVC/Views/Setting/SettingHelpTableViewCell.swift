//
//  SettingHelpTableViewCell.swift
//  interview
//
//  Created by Anh Kiet on 17/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

class SettingHelpTableViewCell: UITableViewCell {
    
    // MARK: Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.attributedText = .init(
            string: "setting_help_support".localized(),
            attributes: Helper.attributes(
                font: .systemFont(ofSize: 12, weight: .bold),
                textColor: .appColor(.text)
            )
        )
        
        return label
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appColor(.container)
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0
        
        return stackView
    }()
    
    // Share
    private let shareContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let shareImageView: UIImageView = {
        let image = UIImage(systemName: "square.and.arrow.up.circle")?
            .withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .appColor(.text)
        
        return imageView
    }()
    
    private let shareLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.attributedText = .init(
            string: "setting_share_app".localized(),
            attributes: Helper.attributes(
                font: .systemFont(ofSize: 14, weight: .regular),
                textColor: .appColor(.text)
            )
        )
        
        return label
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self,
                         action: #selector(didFinishTouchingShareApp(_:)),
                         for: .touchUpInside)
        
        return button
    }()
    
    private let shareNextImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "ic_next")?
            .withRenderingMode(.alwaysTemplate))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .appColor(.text)
        
        return imageView
    }()
    
    private let shareLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appColor(.background)
        
        return view
    }()
    
    // Rate Us
    private let rateContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let rateImageView: UIImageView = {
        let image = UIImage(systemName: "star.circle")?
            .withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .appColor(.text)
        
        return imageView
    }()
    
    private let rateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.attributedText = .init(
            string: "setting_rate_us".localized(),
            attributes: Helper.attributes(
                font: .systemFont(ofSize: 14, weight: .regular),
                textColor: .appColor(.text)
            )
        )
        
        return label
    }()
    
    private lazy var rateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self,
                         action: #selector(didFinishTouchingRateUs(_:)),
                         for: .touchUpInside)
        
        return button
    }()
    
    private let rateNextImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "ic_next")?
            .withRenderingMode(.alwaysTemplate))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .appColor(.text)
        
        return imageView
    }()
    
    private let rateLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appColor(.background)
        
        return view
    }()
    
    // FAQ
    private let questionContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let questionImageView: UIImageView = {
        let image = UIImage(systemName: "questionmark.circle")?
            .withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .appColor(.text)
        
        return imageView
    }()
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.attributedText = .init(
            string: "setting_faq".localized(),
            attributes: Helper.attributes(
                font: .systemFont(ofSize: 14, weight: .regular),
                textColor: .appColor(.text)
            )
        )
        
        return label
    }()
    
    private lazy var questionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self,
                         action: #selector(didFinishTouchingFAQ(_:)),
                         for: .touchUpInside)
        
        return button
    }()
    
    private let faqNextImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "ic_next")?
            .withRenderingMode(.alwaysTemplate))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .appColor(.text)
        
        return imageView
    }()
    
    private let faqLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appColor(.background)
        
        return view
    }()
    
    // Feedback
    private let feedbackContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let feedbackImageView: UIImageView = {
        let image = UIImage(systemName: "plus.message")?
            .withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .appColor(.text)
        
        return imageView
    }()
    
    private let feedbackLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.attributedText = .init(
            string: "setting_feedback".localized(),
            attributes: Helper.attributes(
                font: .systemFont(ofSize: 14, weight: .regular),
                textColor: .appColor(.text)
            )
        )
        
        return label
    }()
    
    private lazy var feedbackButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self,
                         action: #selector(didFinishTouchingFeedback(_:)),
                         for: .touchUpInside)
        
        return button
    }()
    
    private let feedbackNextImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "ic_next")?
            .withRenderingMode(.alwaysTemplate))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .appColor(.text)
        
        return imageView
    }()
    
    // MARK: Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Layout's
    private func setupView() {
        selectionStyle = .none
        backgroundColor = .clear
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(containerView)
        
        containerView.addSubview(stackView)
        
        stackView.addArrangedSubview(shareContainerView)
        stackView.addArrangedSubview(rateContainerView)
        stackView.addArrangedSubview(questionContainerView)
        stackView.addArrangedSubview(feedbackContainerView)
        
        shareContainerView.addSubview(shareImageView)
        shareContainerView.addSubview(shareLabel)
        shareContainerView.addSubview(shareButton)
        shareContainerView.addSubview(shareNextImageView)
        shareContainerView.addSubview(shareLineView)
        
        rateContainerView.addSubview(rateImageView)
        rateContainerView.addSubview(rateLabel)
        rateContainerView.addSubview(rateButton)
        rateContainerView.addSubview(rateNextImageView)
        rateContainerView.addSubview(rateLineView)
        
        questionContainerView.addSubview(questionImageView)
        questionContainerView.addSubview(questionLabel)
        questionContainerView.addSubview(questionButton)
        questionContainerView.addSubview(faqNextImageView)
        questionContainerView.addSubview(faqLineView)
        
        feedbackContainerView.addSubview(feedbackImageView)
        feedbackContainerView.addSubview(feedbackLabel)
        feedbackContainerView.addSubview(feedbackButton)
        feedbackContainerView.addSubview(feedbackNextImageView)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: 16
            ),
            titleLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor, constant: 8
            ),
            
            containerView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: 16
            ),
            containerView.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor, constant: 8
            ),
            containerView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -16
            ),
            containerView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor, constant: -8
            ),
            
            stackView.topAnchor.constraint(
                equalTo: containerView.topAnchor, constant: 8
            ),
            stackView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor, constant: 16
            ),
            stackView.bottomAnchor.constraint(
                equalTo: containerView.bottomAnchor, constant: -8
            ),
            stackView.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor, constant: -16
            ),
            
            shareButton.leadingAnchor.constraint(equalTo: shareContainerView.leadingAnchor),
            shareButton.topAnchor.constraint(equalTo: shareContainerView.topAnchor),
            shareButton.trailingAnchor.constraint(equalTo: shareContainerView.trailingAnchor),
            shareButton.bottomAnchor.constraint(equalTo: shareContainerView.bottomAnchor),
            
            shareImageView.topAnchor.constraint(
                equalTo: shareContainerView.topAnchor, constant: 16
            ),
            shareImageView.leadingAnchor.constraint(equalTo: shareContainerView.leadingAnchor),
            shareImageView.widthAnchor.constraint(equalToConstant: 24),
            shareImageView.heightAnchor.constraint(equalToConstant: 24),
            
            shareLabel.centerYAnchor.constraint(equalTo: shareContainerView.centerYAnchor),
            shareLabel.leadingAnchor.constraint(
                equalTo: shareImageView.trailingAnchor, constant: 8
            ),
            
            shareNextImageView.leadingAnchor.constraint(
                equalTo: shareLabel.trailingAnchor, constant: 4
            ),
            shareNextImageView.centerYAnchor.constraint(equalTo: shareContainerView.centerYAnchor),
            shareNextImageView.trailingAnchor.constraint(equalTo: shareContainerView.trailingAnchor),
            shareNextImageView.widthAnchor.constraint(equalToConstant: 24),
            shareNextImageView.heightAnchor.constraint(equalToConstant: 24),
            
            shareLineView.leadingAnchor.constraint(equalTo: shareLabel.leadingAnchor),
            shareLineView.topAnchor.constraint(
                equalTo: shareImageView.bottomAnchor, constant: 16
            ),
            shareLineView.trailingAnchor.constraint(equalTo: shareContainerView.trailingAnchor),
            shareLineView.bottomAnchor.constraint(equalTo: shareContainerView.bottomAnchor),
            shareLineView.heightAnchor.constraint(equalToConstant: 1),
            
            rateButton.leadingAnchor.constraint(equalTo: rateContainerView.leadingAnchor),
            rateButton.topAnchor.constraint(equalTo: rateContainerView.topAnchor),
            rateButton.trailingAnchor.constraint(equalTo: rateContainerView.trailingAnchor),
            rateButton.bottomAnchor.constraint(equalTo: rateContainerView.bottomAnchor),
            
            rateImageView.topAnchor.constraint(
                equalTo: rateContainerView.topAnchor, constant: 16
            ),
            rateImageView.leadingAnchor.constraint(equalTo: rateContainerView.leadingAnchor),
            rateImageView.widthAnchor.constraint(equalToConstant: 24),
            rateImageView.heightAnchor.constraint(equalToConstant: 24),
            
            rateLabel.centerYAnchor.constraint(equalTo: rateContainerView.centerYAnchor),
            rateLabel.leadingAnchor.constraint(
                equalTo: rateImageView.trailingAnchor, constant: 8
            ),
            
            rateNextImageView.leadingAnchor.constraint(
                equalTo: rateLabel.trailingAnchor, constant: 4
            ),
            rateNextImageView.centerYAnchor.constraint(equalTo: rateContainerView.centerYAnchor),
            rateNextImageView.trailingAnchor.constraint(equalTo: rateContainerView.trailingAnchor),
            rateNextImageView.widthAnchor.constraint(equalToConstant: 24),
            rateNextImageView.heightAnchor.constraint(equalToConstant: 24),
            
            rateLineView.leadingAnchor.constraint(equalTo: rateLabel.leadingAnchor),
            rateLineView.topAnchor.constraint(
                equalTo: rateImageView.bottomAnchor, constant: 16
            ),
            rateLineView.trailingAnchor.constraint(equalTo: rateContainerView.trailingAnchor),
            rateLineView.bottomAnchor.constraint(equalTo: rateContainerView.bottomAnchor),
            rateLineView.heightAnchor.constraint(equalToConstant: 1),
            
            questionButton.leadingAnchor.constraint(equalTo: questionContainerView.leadingAnchor),
            questionButton.topAnchor.constraint(equalTo: questionContainerView.topAnchor),
            questionButton.trailingAnchor.constraint(equalTo: questionContainerView.trailingAnchor),
            questionButton.bottomAnchor.constraint(equalTo: questionContainerView.bottomAnchor),
            
            questionImageView.topAnchor.constraint(
                equalTo: questionContainerView.topAnchor, constant: 16
            ),
            questionImageView.leadingAnchor.constraint(equalTo: questionContainerView.leadingAnchor),
            questionImageView.widthAnchor.constraint(equalToConstant: 24),
            questionImageView.heightAnchor.constraint(equalToConstant: 24),
            
            questionLabel.centerYAnchor.constraint(equalTo: questionContainerView.centerYAnchor),
            questionLabel.leadingAnchor.constraint(
                equalTo: questionImageView.trailingAnchor, constant: 8
            ),
            
            faqNextImageView.leadingAnchor.constraint(
                equalTo: questionLabel.trailingAnchor, constant: 4
            ),
            faqNextImageView.centerYAnchor.constraint(equalTo: questionContainerView.centerYAnchor),
            faqNextImageView.trailingAnchor.constraint(equalTo: questionContainerView.trailingAnchor),
            faqNextImageView.widthAnchor.constraint(equalToConstant: 24),
            faqNextImageView.heightAnchor.constraint(equalToConstant: 24),
            
            faqLineView.leadingAnchor.constraint(equalTo: questionLabel.leadingAnchor),
            faqLineView.topAnchor.constraint(
                equalTo: questionImageView.bottomAnchor, constant: 16
            ),
            faqLineView.trailingAnchor.constraint(equalTo: questionContainerView.trailingAnchor),
            faqLineView.bottomAnchor.constraint(equalTo: questionContainerView.bottomAnchor),
            faqLineView.heightAnchor.constraint(equalToConstant: 1),
            
            feedbackButton.leadingAnchor.constraint(equalTo: feedbackContainerView.leadingAnchor),
            feedbackButton.topAnchor.constraint(equalTo: feedbackContainerView.topAnchor),
            feedbackButton.trailingAnchor.constraint(equalTo: feedbackContainerView.trailingAnchor),
            feedbackButton.bottomAnchor.constraint(equalTo: feedbackContainerView.bottomAnchor),
            
            feedbackImageView.topAnchor.constraint(
                equalTo: feedbackContainerView.topAnchor, constant: 16
            ),
            feedbackImageView.leadingAnchor.constraint(equalTo: feedbackContainerView.leadingAnchor),
            feedbackImageView.bottomAnchor.constraint(
                equalTo: feedbackContainerView.bottomAnchor, constant: -16
            ),
            feedbackImageView.widthAnchor.constraint(equalToConstant: 24),
            feedbackImageView.heightAnchor.constraint(equalToConstant: 24),
            
            feedbackLabel.centerYAnchor.constraint(equalTo: feedbackContainerView.centerYAnchor),
            feedbackLabel.leadingAnchor.constraint(
                equalTo: feedbackImageView.trailingAnchor, constant: 8
            ),
            
            feedbackNextImageView.leadingAnchor.constraint(
                equalTo: feedbackLabel.trailingAnchor, constant: 4
            ),
            feedbackNextImageView.centerYAnchor.constraint(equalTo: feedbackContainerView.centerYAnchor),
            feedbackNextImageView.trailingAnchor.constraint(equalTo: feedbackContainerView.trailingAnchor),
            feedbackNextImageView.widthAnchor.constraint(equalToConstant: 24),
            feedbackNextImageView.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    // MARK: Handle actions
    @objc private func didFinishTouchingShareApp(_ sender: UIButton) {
        AlertManager.alert(title: "Alert", message: "Share app feature!")
    }
    
    @objc private func didFinishTouchingRateUs(_ sender: UIButton) {
        AlertManager.alert(title: "Alert", message: "Rate us feature!")
    }
    
    @objc private func didFinishTouchingFAQ(_ sender: UIButton) {
        AlertManager.alert(title: "Alert", message: "FAQ feature!")
    }
    
    @objc private func didFinishTouchingFeedback(_ sender: UIButton) {
        AlertManager.alert(title: "Alert", message: "Feedback feature!")
    }
}
