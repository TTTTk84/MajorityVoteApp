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
    let items = List<VoteItem>()
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
    
    func itemCount() -> [Int] {
        print("items: \(items)")
        let listItems = Array(items)
        var items: [Int] = []

        for item in listItems {
            items.append(item.count)
        }
        return items
    }
}

