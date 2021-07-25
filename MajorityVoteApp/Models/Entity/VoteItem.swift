//
//  VoteItem.swift
//  MajorityVoteApp
//
//  Created by tk84 on 2021/07/20.
//

import Foundation
import RealmSwift

class VoteItem: Object {
    @objc dynamic var id = NSUUID().uuidString
    @objc dynamic var createAt = Date()
    @objc dynamic var count = 0
    @objc dynamic var name = ""
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
    
}
