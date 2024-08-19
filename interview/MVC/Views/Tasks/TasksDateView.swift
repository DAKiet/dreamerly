//
//  TasksDateView.swift
//  interview
//
//  Created by Anh Kiet on 19/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

class TasksDateView: UIView {
    
    // MARK: Properties
    private let dayTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        
        return label
    }()
    
    private let dayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let calendarManager = CalendarManager()
    private let day: Day
    private let dayTitle: String
    
    var isSelected: Bool {
        didSet {
            updateData()
        }
    }
    
    // MARK: Initialization
    init(day: Day, isSelected: Bool, frame: CGRect = .zero) {
        self.day = day
        self.isSelected = isSelected
        
        calendarManager.dateFormat = "EEE"
        let weekdays = calendarManager.string(from: day.date)
        self.dayTitle = weekdays.uppercased()
        
        super.init(frame: frame)
        
        setupView()
        updateData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Layout
    private func setupView() {
        clipsToBounds = true
        layer.cornerRadius = 12
        
        addSubview(dayTitleLabel)
        addSubview(dayLabel)
        addSubview(button)
        
        NSLayoutConstraint.activate([
            dayTitleLabel.topAnchor.constraint(equalTo: topAnchor),
            dayTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            dayLabel.topAnchor.constraint(equalTo: dayTitleLabel.bottomAnchor, constant: 10),
            dayLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.topAnchor.constraint(equalTo: topAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func updateData() {
        dayTitleLabel.attributedText = .init(
            string: dayTitle,
            attributes: Helper.attributes(
                font: .systemFont(ofSize: 10, weight: .bold),
                textColor: .appColor(.subtext),
                lineHeight: 16, textAlignment: .center
            )
        )
        
        if isSelected {
            if day.isNow {
                backgroundColor = .appColor(.primary)
            } else {
                backgroundColor = .appColor(.container)
            }
            
            dayLabel.attributedText = .init(
                string: day.number,
                attributes: Helper.attributes(
                    font: .systemFont(ofSize: 14, weight: .bold),
                    textColor: .appColor(.text),
                    lineHeight: 20, textAlignment: .center
                )
            )
        } else {
            backgroundColor = .clear
            
            
            if day.isNow {
                dayLabel.attributedText = .init(
                    string: day.number,
                    attributes: Helper.attributes(
                        font: .systemFont(ofSize: 14, weight: .bold),
                        textColor: .appColor(.primary),
                        lineHeight: 20, textAlignment: .center
                    )
                )
            } else {
                dayLabel.attributedText = .init(
                    string: day.number,
                    attributes: Helper.attributes(
                        font: .systemFont(ofSize: 14, weight: .bold),
                        textColor: .appColor(.text),
                        lineHeight: 20, textAlignment: .center
                    )
                )
            }
        }
    }
    
    func addTarget(_ target: Any?, action: Selector, index: Int) {
        button.tag = index
        button.addTarget(target, action: action, for: .touchUpInside)
    }
}
