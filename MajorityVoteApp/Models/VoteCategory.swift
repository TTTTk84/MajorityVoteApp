//
//  VoteCategory.swift
//  MajorityVoteApp
//
//  Created by tk84 on 2021/07/20.
//

import Foundation
import RealmSwift

class VoteCategory: Object {
    @objc dynamic var id = NSUUID().uuidString
    @objc dynamic var createAt = Date()
    @objc dynamic var name = ""
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
    
}
