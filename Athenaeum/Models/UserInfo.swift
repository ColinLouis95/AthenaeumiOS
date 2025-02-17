//
//  Data.swift
//  Athenaeum
//
//  Created by Colin Kugler on 2/2/25.
//

import Foundation
import SwiftData

@Model
class UserInfo: Identifiable {
    var username: String
    var password: String
    var site: String
    var notes: String
    var id: UUID = UUID()
    
    init(username: String = "", password: String = "", site: String = "", notes: String = "") {
        self.username = username
        self.password = password
        self.site = site
        self.notes = notes
    }
    
}
