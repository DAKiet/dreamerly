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
        view.backgroundColor = .homeWidget
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        
        return view
    }()
    
    private let priorityTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.text = "My Priority Task"
        
        return label
    }()
    
    private let checkBoxView1: CheckboxView = {
        let view = CheckboxView(
            with: "Doing exercise 45 min",
            textColor: .black,
            isChecked: true
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        
        return view
    }()
    
    private let checkBoxView2: CheckboxView = {
        let view = CheckboxView(
            with: "Doing meditation",
            textColor: .black,
            isChecked: false
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        
        return view
    }()
    
    private let checkBoxView3: CheckboxView = {
        let view = CheckboxView(
            with: "Read a self-improvement book",
            textColor: .black,
            isChecked: false
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        
        return view
    }()
    
    private let checkBoxView4: CheckboxView = {
        let view = CheckboxView(
            with: "Buy coffee in the store",
            textColor: .black,
            isChecked: false
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        
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
    
    private let dailyTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .appColor(.text)
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.text = "Daily Task"
        
        return label
    }()
    
    private let dailyDescLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .appColor(.subtext)
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.text = "8 out of 10 done"
        
        return label
    }()
    
    private let sharedView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemYellow
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        
        return view
    }()
    
    private let sharedTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.text = "Shared Workspace"
        return label
    }()
    
    private let sharedLabel1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .black
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.text = "✅ Layerio Daily..."
        
        return label
    }()
    
    private let sharedLabel2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .black
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.text = "⚙️ Our roject"
        
        return label
    }()
    
    private let sharedLabel3: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .black
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.text = "🧳 Layerio..."
        
        return label
    }()
    
    private let privateTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.text = "Private Workspace"
        
        return label
    }()
    
    private let privateLabel1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .black
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.text = "Human Resource"
        
        return label
    }()
    
    private let privateLabel2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .black
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.text = "Employee Salary"
        
        return label
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
        priorityView.addSubview(priorityTitleLabel)
        priorityView.addSubview(checkBoxView1)
        priorityView.addSubview(checkBoxView2)
        priorityView.addSubview(checkBoxView3)
        priorityView.addSubview(checkBoxView4)
        
        contentView.addSubview(dailyView)
        dailyView.addSubview(dailyTitleLabel)
        dailyView.addSubview(dailyDescLabel)
        
        contentView.addSubview(sharedView)
        
        sharedView.addSubview(sharedTitleLabel)
        sharedView.addSubview(sharedLabel1)
        sharedView.addSubview(sharedLabel2)
        sharedView.addSubview(sharedLabel3)
        
        sharedView.addSubview(privateTitleLabel)
        sharedView.addSubview(privateLabel1)
        sharedView.addSubview(privateLabel2)
        
        NSLayoutConstraint.activate([
            priorityView.topAnchor.constraint(equalTo: contentView.topAnchor),
            priorityView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: 16
            ),
            priorityView.widthAnchor.constraint(
                equalTo: widthAnchor, multiplier: 4 / 7
            ),
            
            priorityTitleLabel.leadingAnchor.constraint(
                equalTo: priorityView.leadingAnchor, constant: 16
            ),
            priorityTitleLabel.topAnchor.constraint(
                equalTo: priorityView.topAnchor, constant: 16
            ),
            priorityTitleLabel.trailingAnchor.constraint(
                equalTo: priorityView.trailingAnchor, constant: -16
            ),
            
            checkBoxView1.leadingAnchor.constraint(
                equalTo: priorityView.leadingAnchor, constant: 16
            ),
            checkBoxView1.topAnchor.constraint(
                equalTo: priorityTitleLabel.bottomAnchor, constant: 8
            ),
            checkBoxView1.trailingAnchor.constraint(
                equalTo: priorityView.trailingAnchor, constant: -16
            ),
            checkBoxView1.heightAnchor.constraint(equalToConstant: 24),
            
            checkBoxView2.leadingAnchor.constraint(equalTo: checkBoxView1.leadingAnchor),
            checkBoxView2.topAnchor.constraint(
                equalTo: checkBoxView1.bottomAnchor, constant: 4
            ),
            checkBoxView2.trailingAnchor.constraint(equalTo: checkBoxView1.trailingAnchor),
            checkBoxView2.heightAnchor.constraint(equalTo: checkBoxView1.heightAnchor),
            
            checkBoxView3.leadingAnchor.constraint(equalTo: checkBoxView1.leadingAnchor),
            checkBoxView3.topAnchor.constraint(
                equalTo: checkBoxView2.bottomAnchor, constant: 4
            ),
            checkBoxView3.trailingAnchor.constraint(equalTo: checkBoxView1.trailingAnchor),
            checkBoxView3.heightAnchor.constraint(equalTo: checkBoxView1.heightAnchor),
            
            checkBoxView4.leadingAnchor.constraint(equalTo: checkBoxView1.leadingAnchor),
            checkBoxView4.topAnchor.constraint(
                equalTo: checkBoxView3.bottomAnchor, constant: 4
            ),
            checkBoxView4.trailingAnchor.constraint(equalTo: checkBoxView1.trailingAnchor),
            checkBoxView4.bottomAnchor.constraint(
                equalTo: priorityView.bottomAnchor, constant: -16
            ),
            checkBoxView4.heightAnchor.constraint(equalTo: checkBoxView1.heightAnchor),
            
            dailyView.leadingAnchor.constraint(equalTo: priorityView.leadingAnchor),
            dailyView.topAnchor.constraint(
                equalTo: priorityView.bottomAnchor, constant: 6
            ),
            dailyView.trailingAnchor.constraint(equalTo: priorityView.trailingAnchor),
            dailyView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            dailyTitleLabel.leadingAnchor.constraint(
                equalTo: dailyView.leadingAnchor, constant: 16
            ),
            dailyTitleLabel.topAnchor.constraint(
                equalTo: dailyView.topAnchor, constant: 16
            ),
            dailyTitleLabel.trailingAnchor.constraint(
                equalTo: dailyView.trailingAnchor, constant: 16
            ),
            
            dailyDescLabel.leadingAnchor.constraint(
                equalTo: dailyView.leadingAnchor, constant: 16
            ),
            dailyDescLabel.topAnchor.constraint(
                equalTo: dailyTitleLabel.bottomAnchor, constant: 8
            ),
            dailyDescLabel.trailingAnchor.constraint(
                equalTo: dailyView.trailingAnchor, constant: 16
            ),
            dailyDescLabel.bottomAnchor.constraint(
                equalTo: dailyView.bottomAnchor, constant: -16
            ),
            
            sharedView.topAnchor.constraint(equalTo: contentView.topAnchor),
            sharedView.leadingAnchor.constraint(
                equalTo: priorityView.trailingAnchor, constant: 8
            ),
            sharedView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -16
            ),
            sharedView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            sharedTitleLabel.leadingAnchor.constraint(
                equalTo: sharedView.leadingAnchor, constant: 16
            ),
            sharedTitleLabel.topAnchor.constraint(
                equalTo: sharedView.topAnchor, constant: 16
            ),
            sharedTitleLabel.trailingAnchor.constraint(
                equalTo: sharedView.trailingAnchor, constant: -16
            ),
            
            sharedLabel1.leadingAnchor.constraint(
                equalTo: sharedView.leadingAnchor, constant: 18
            ),
            sharedLabel1.topAnchor.constraint(
                equalTo: sharedTitleLabel.bottomAnchor, constant: 8
            ),
            sharedLabel1.trailingAnchor.constraint(
                equalTo: sharedView.trailingAnchor, constant: -18
            ),
            
            sharedLabel2.leadingAnchor.constraint(equalTo: sharedLabel1.leadingAnchor),
            sharedLabel2.topAnchor.constraint(
                equalTo: sharedLabel1.bottomAnchor, constant: 8
            ),
            sharedLabel2.trailingAnchor.constraint(equalTo: sharedLabel1.trailingAnchor),
            
            sharedLabel3.leadingAnchor.constraint(equalTo: sharedLabel1.leadingAnchor),
            sharedLabel3.topAnchor.constraint(
                equalTo: sharedLabel2.bottomAnchor, constant: 8
            ),
            sharedLabel3.trailingAnchor.constraint(equalTo: sharedLabel1.trailingAnchor),
            
            privateTitleLabel.leadingAnchor.constraint(
                equalTo: sharedView.leadingAnchor, constant: 16
            ),
            privateTitleLabel.topAnchor.constraint(
                equalTo: sharedLabel3.bottomAnchor, constant: 24
            ),
            privateTitleLabel.trailingAnchor.constraint(
                equalTo: sharedView.trailingAnchor, constant: -16
            ),
            
            privateLabel1.leadingAnchor.constraint(
                equalTo: sharedView.leadingAnchor, constant: 18
            ),
            privateLabel1.topAnchor.constraint(
                equalTo: privateTitleLabel.bottomAnchor, constant: 8
            ),
            privateLabel1.trailingAnchor.constraint(
                equalTo: sharedView.trailingAnchor, constant: -18
            ),
            
            privateLabel2.leadingAnchor.constraint(equalTo: privateLabel1.leadingAnchor),
            privateLabel2.topAnchor.constraint(
                equalTo: privateLabel1.bottomAnchor, constant: 8
            ),
            privateLabel2.trailingAnchor.constraint(equalTo: privateLabel1.trailingAnchor)
        ])
    }
}
