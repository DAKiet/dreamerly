//
//  TasksViewController.swift
//  interview
//
//  Created by Anh Kiet on 17/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import UIKit

class TasksViewController: BaseViewController {
    
    // MARK: Properties
    private lazy var calendarButton: UIButton = {
        var config: UIButton.Configuration = .plain()
        config.image = UIImage(systemName: "calendar.circle")?
            .withRenderingMode(.alwaysTemplate)
        config.contentInsets = .init(top: 8, leading: 8, bottom: 8, trailing: 8)
        config.baseForegroundColor = .appColor(.text)
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self,
                         action: #selector(didFinishTouchingCalendar(_:)),
                         for: .touchUpInside)
        
        return button
    }()
    
    private lazy var filterView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private lazy var selectedDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.attributedText = .init(
            string: selectedDate.toString("EEEE, d MMMM yyyy"),
            attributes: Helper.attributes(
                font: .systemFont(ofSize: 18, weight: .bold),
                textColor: .appColor(.text), lineHeight: 26
            )
        )
        
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.contentInset.bottom = 8
        tableView.showsVerticalScrollIndicator = false
        tableView.register(EmptyTableViewCell.self,
                           forCellReuseIdentifier: EmptyTableViewCell.identifier)
        tableView.register(TaskTableViewCell.self,
                           forCellReuseIdentifier: TaskTableViewCell.identifier)
        
        return tableView
    }()
    
    private lazy var createButton: UIButton = {
        var config: UIButton.Configuration = .filled()
        config.image = UIImage(systemName: "plus")?
            .withRenderingMode(.alwaysTemplate)
        config.contentInsets = .init(top: 8, leading: 8, bottom: 8, trailing: 8)
        config.baseForegroundColor = .white
        config.cornerStyle = .capsule
        config.baseBackgroundColor = .appColor(.primary)
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self,
                         action: #selector(didFinishTouchingCreateButton(_:)),
                         for: .touchUpInside)
        
        return button
    }()
    
    private let calendarManager = CalendarManager()
    
    private var days: [Day] = []
    private var selectedDate: Date = Date().dateIgnoreTime
    private var tasks: [TaskModel] = []
    
    override var navigationTitle: String {
        return "Tasks"
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRightBarButtonItem(calendarButton)
        setupDateFilter()
        setupView()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: Layout
    private func setupView() {
        view.addSubview(filterView)
        filterView.addSubview(stackView)
        
        view.addSubview(selectedDateLabel)
        view.addSubview(tableView)
        view.addSubview(createButton)
        
        NSLayoutConstraint.activate([
            filterView.topAnchor.constraint(equalTo: navigationBarView.bottomAnchor),
            filterView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            filterView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            filterView.heightAnchor.constraint(equalToConstant: 74),
            
            stackView.topAnchor.constraint(equalTo: filterView.topAnchor),
            stackView.leadingAnchor.constraint(
                equalTo: filterView.leadingAnchor, constant: 16
            ),
            stackView.bottomAnchor.constraint(
                equalTo: filterView.bottomAnchor, constant: -16
            ),
            stackView.trailingAnchor.constraint(
                equalTo: filterView.trailingAnchor, constant: -16
            ),
            
            selectedDateLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: 16
            ),
            selectedDateLabel.topAnchor.constraint(equalTo: filterView.bottomAnchor),
            selectedDateLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -16
            ),
            
            tableView.topAnchor.constraint(
                equalTo: selectedDateLabel.bottomAnchor, constant: 8
            ),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            createButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -16
            ),
            createButton.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -16
            ),
            createButton.widthAnchor.constraint(equalToConstant: 48),
            createButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    private func setupDateFilter() {
        stackView.arrangedSubviews.forEach {
            stackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
        
        let date = selectedDate.startOfWeek
        self.days = []
        var i = 0
        
        while i < 7 {
            let day = calendarManager.generateDay(offsetBy: i,
                                                  for: date,
                                                  isWithinDisplayedMonth: true)
            let view = TasksDateView(day: day,
                                     isSelected: day.date == selectedDate)
            view.clipsToBounds = true
            view.layer.cornerRadius = 8
            view.addTarget(self,
                           action: #selector(didFinishTouchingDate(_:)),
                           index: i)
            stackView.addArrangedSubview(view)
            self.days.append(day)
            i += 1
        }
    }
    
    private func selectedDate(_ date: Date, isReloadFilter: Bool) {
        self.selectedDate = date
        selectedDateLabel.attributedText = .init(
            string: date.toString("EEEE, d MMMM yyyy"),
            attributes: Helper.attributes(
                font: .systemFont(ofSize: 18, weight: .bold),
                textColor: .appColor(.text), lineHeight: 26
            )
        )
        
        if isReloadFilter {
            setupDateFilter()
        } else {
            updateStatusFilter()
        }
        
        tableView.reloadData()
    }
    
    private func updateStatusFilter() {
        for i in 0..<stackView.arrangedSubviews.count {
            guard let filterView = stackView.arrangedSubviews[i] as? TasksDateView else { return }
            
            filterView.isSelected = days[i].date == selectedDate
        }
    }
    
    // MARK: Handle action
    @objc private func didFinishTouchingDate(_ sender: UIButton) {
        selectedDate(days[sender.tag].date, isReloadFilter: false)
    }
    
    @objc private func didFinishTouchingCalendar(_ sender: UIButton) {
        AlertManager.alert(title: "Alert", message: "Open calendar feature!")
    }
    
    @objc private func didFinishTouchingCreateButton(_ sender: UIButton) {
        AlertManager.alert(title: "Alert", message: "Create new tasks feature!")
    }
}

// MARK: UITableViewDataSource
extension TasksViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = globalData.tasks.count
        return count > 0 ? count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard !globalData.tasks.isEmpty else {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: EmptyTableViewCell.identifier, for: indexPath
            ) as! EmptyTableViewCell
            cell.setup(
                title: "task_empty_title".localized(),
                description: "task_empty_description".localized()
            )
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TaskTableViewCell.identifier, for: indexPath
        ) as! TaskTableViewCell
        cell.setupData(globalData.tasks[indexPath.row])
        
        return cell
    }
}

// MARK: UITableViewDelegate
extension TasksViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = globalData.tasks[indexPath.row]
        Navigator.navigateToTaskDetail(from: self, with: task)
    }
}
