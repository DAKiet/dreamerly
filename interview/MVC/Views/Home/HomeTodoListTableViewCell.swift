//
//  HomeTodoListTableViewCell.swift
//  interview
//
//  Created by Anh Kiet on 17/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

class HomeTodoListTableViewCell: UITableViewCell {
    
    // MARK: Properties
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appColor(.container)
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        
        return view
    }()
    
    private let checkBoxView: CheckboxView = {
        let view = CheckboxView(with: "", textColor: .black, isChecked: false)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        
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
        
        contentView.addSubview(containerView)
        containerView.addSubview(checkBoxView)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: 16
            ),
            containerView.topAnchor.constraint(
                equalTo: contentView.topAnchor, constant: 4
            ),
            containerView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -16
            ),
            containerView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor, constant: -4
            ),
            containerView.heightAnchor.constraint(equalToConstant: 40),
            
            checkBoxView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor, constant: 16
            ),
            checkBoxView.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkBoxView.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor, constant: -16
            )
        ])
    }
    
    // MARK: Set data
    func setData(_ task: TaskModel) {
        checkBoxView.setData(
            with: task.title,
            textColor: UIColor.appColor(.text),
            isChecked: task.status == .done
        )
    }
}
