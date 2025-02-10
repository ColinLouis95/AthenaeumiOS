//
//  Data.swift
//  Athenaeum
//
//  Created by Colin Kugler on 2/2/25.
//

import Foundation
import SwiftData

@Model
class UserInfo {
    var username: String
    var password: String
    var site: String
    var notes: String
    
    init(username: String = "", password: String = "", site: String = "", notes: String = "") {
        self.username = username
        self.password = password
        self.site = site
        self.notes = notes
    }
    
}
