//
//  User.swift
//  Auction App
//
//  Created by Rodrigo Conte on 23/02/21.
//

import Foundation

class User {
    
    let id: Int?
    let name: String
    
    init(id: Int? = nil, name: String) {
        self.id = id
        self.name = name
    }
}

extension User: Equatable {
    static func == (lhs: User, rhs: User) -> Bool {
        if lhs.id != rhs.id || lhs.name != rhs.name {
            return false
        } else {
            return true
        }
    }
}
