//
//  TaskMediaView.swift
//  interview
//
//  Created by Anh Kiet on 20/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

class TaskMediaView: UIView {
    
    // MARK: Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .appColor(.text)
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.text = "MEDIA"
        
        return label
    }()
    
    private let mediaImageView1: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "landingpage-1"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        
        return imageView
    }()
    
    private let mediaImageView2: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "landingpage-2"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        
        return imageView
    }()
    
    private let mediaImageView3: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "landingpage-3"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        
        return imageView
    }()
    
    private let moreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .appColor(.subtext)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.text = "+3"
        
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
        addSubview(mediaImageView1)
        addSubview(mediaImageView2)
        addSubview(mediaImageView3)
        addSubview(moreLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            mediaImageView1.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor, constant: 20
            ),
            mediaImageView1.leadingAnchor.constraint(equalTo: leadingAnchor),
            mediaImageView1.bottomAnchor.constraint(equalTo: bottomAnchor),
            mediaImageView1.widthAnchor.constraint(equalToConstant: 56),
            mediaImageView1.heightAnchor.constraint(equalToConstant: 56),
            
            mediaImageView2.leadingAnchor.constraint(
                equalTo: mediaImageView1.trailingAnchor, constant: 16
            ),
            mediaImageView2.centerYAnchor.constraint(equalTo: mediaImageView1.centerYAnchor),
            mediaImageView2.widthAnchor.constraint(equalTo: mediaImageView1.widthAnchor),
            mediaImageView2.heightAnchor.constraint(equalTo: mediaImageView1.heightAnchor),
            
            mediaImageView3.leadingAnchor.constraint(
                equalTo: mediaImageView2.trailingAnchor, constant: 16
            ),
            mediaImageView3.centerYAnchor.constraint(equalTo: mediaImageView1.centerYAnchor),
            mediaImageView3.widthAnchor.constraint(equalTo: mediaImageView1.widthAnchor),
            mediaImageView3.heightAnchor.constraint(equalTo: mediaImageView1.heightAnchor),
            
            moreLabel.leadingAnchor.constraint(
                equalTo: mediaImageView3.trailingAnchor, constant: 8
            ),
            moreLabel.centerYAnchor.constraint(equalTo: mediaImageView1.centerYAnchor),
            moreLabel.widthAnchor.constraint(equalTo: mediaImageView1.widthAnchor),
            moreLabel.heightAnchor.constraint(equalTo: mediaImageView1.heightAnchor)
        ])
    }
}
