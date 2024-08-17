//
//  HomeWidgetTableViewCell.swift
//  interview
//
//  Created by Anh Kiet on 17/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

class HomeWidgetTableViewCell: UITableViewCell {
    
    // MARK: Properties
    private let priorityView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .purple
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        
        return view
    }()
    
    private let dailyView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appColor(.container)
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        
        return view
    }()
    
    private let sharedView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemYellow
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        
        return view
    }()
    
    // MARK: Initialization
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
        
        contentView.addSubview(priorityView)
        contentView.addSubview(dailyView)
        contentView.addSubview(sharedView)
        
        NSLayoutConstraint.activate([
            priorityView.topAnchor.constraint(equalTo: contentView.topAnchor),
            priorityView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: 16
            ),
            priorityView.widthAnchor.constraint(
                equalTo: widthAnchor, multiplier: 4 / 7
            ),
            
            dailyView.leadingAnchor.constraint(equalTo: priorityView.leadingAnchor),
            dailyView.topAnchor.constraint(equalTo: priorityView.bottomAnchor, constant: 8),
            dailyView.trailingAnchor.constraint(equalTo: priorityView.trailingAnchor),
            dailyView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            sharedView.topAnchor.constraint(equalTo: contentView.topAnchor),
            sharedView.leadingAnchor.constraint(
                equalTo: priorityView.trailingAnchor, constant: 8
            ),
            sharedView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -16
            ),
            sharedView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            priorityView.heightAnchor.constraint(equalToConstant: 216),
            dailyView.heightAnchor.constraint(equalToConstant: 72),
        ])
    }
}
