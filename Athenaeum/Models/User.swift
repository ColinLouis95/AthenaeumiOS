//
//  User.swift
//  Athenaeum
//
//  Created by Colin Kugler on 2/2/25.
//

import Foundation
import SwiftData

@Model
class User {
    var loginName: String
    var loginPassword: String
    
    init(loginName: String, loginPassword: String) {
        self.loginName = loginName
        self.loginPassword = loginPassword
    }
}
 
