//
//  NotificationModel.swift
//  interview
//
//  Created by Anh Kiet on 19/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import Foundation

struct NotificationModel: Decodable {
    
    let uid: String
    let title: String
    let body: String
    let sentAt: String
    var isRead: Bool
    
    enum CodingKeys: String, CodingKey {
        case uid, title, body
        case sentAt = "sent_at"
        case isRead = "is_read"
    }
    
    init() {
        uid = ""
        title = ""
        body = ""
        sentAt = ""
        isRead = false
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        uid = try container.decodeIfPresent(String.self, forKey: .uid) ?? ""
        title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        body = try container.decodeIfPresent(String.self, forKey: .body) ?? ""
        sentAt = try container.decodeIfPresent(String.self, forKey: .sentAt) ?? ""
        isRead = try container.decodeIfPresent(Bool.self, forKey: .isRead) ?? false
    }
}
