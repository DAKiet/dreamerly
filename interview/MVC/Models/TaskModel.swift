//
//  TaskModel.swift
//  interview
//
//  Created by Anh Kiet on 18/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import Foundation

struct TaskModel: Decodable {
    
    enum Status: String {
        case todo
        case inProgress = "in_progress"
        case inReview = "in_review"
        case done
    }
    
    enum Priority: String {
        case urgent
        case high
        case normal
        case low
    }
    
    let uid: String
    let title: String
    let description: String
    var status: Status = .todo
    var priority: Priority = .low
    let startDate: Double
    let dueDate: Double
    
    enum RootKeys: String, CodingKey {
        case uid, title, description, status, priority
        case startDate = "start_date"
        case dueDate = "due_date"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        
        self.uid = try container.decodeIfPresent(String.self, forKey: .uid) ?? ""
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        
        if
            let statusRW = try container.decodeIfPresent(String.self, forKey: .status),
            let status = Status(rawValue: statusRW)
        {
            self.status = status
        } else {
            self.status = .todo
        }
        
        if
            let priorityRW = try container.decodeIfPresent(String.self, forKey: .priority),
            let priority = Priority(rawValue: priorityRW)
        {
            self.priority = priority
        } else {
            self.priority = .low
        }
        
        self.startDate = try container.decodeIfPresent(Double.self, forKey: .startDate) ?? 0
        self.dueDate = try container.decodeIfPresent(Double.self, forKey: .dueDate) ?? 0
    }
}
