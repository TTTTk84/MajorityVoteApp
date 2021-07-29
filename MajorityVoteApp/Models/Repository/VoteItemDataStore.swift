//
//  VoteItemDataStore.swift
//  MajorityVoteApp
//
//  Created by tk84 on 2021/07/25.
//

import Foundation
import RealmSwift

enum countStatus {
    case plus
    case minus
}

class VoteItemDataStore {
    
    private var realm: Realm!
    private var voteCategory: VoteCategory!
    private var voteCategoryRealm: Results<VoteCategory>!
    
    init(category: VoteCategory) {
        self.realm = AppDelegate.database.getConnection()
        self.voteCategory = category
        self.voteCategoryRealm = realm.objects(VoteCategory.self).filter("id == %@", category.id)
    }
    
    func fetchItems() -> Results<VoteCategory> {
        return voteCategoryRealm
    }
    
    func add(_ item: VoteItem) {
        try! realm.write {
            voteCategory.items.append(item)
        }
    }

    func updateName(item: VoteItem, name: String) {
        let updateItem = voteCategory.items.filter("id == %@", item.id).first!
        try! realm.write {
            updateItem.name = name
        }
    }
    
    func updateCount(item: VoteItem,status: countStatus) {
        let updateItem = voteCategory.items.filter("id == %@", item.id).first!
        
        
        try! realm.write {
            switch status {
            case .plus:
                updateItem.count += 1
            case .minus:
                updateItem.count -= 1
            }
        }
    }

    func delete(item: VoteItem) {
        let deleteItem = voteCategory.items.filter("id == %@", item.id).first!
        try! realm.write {
            realm.delete(deleteItem)
        }
    }
    
}
