//
//  VoteCategoryDataStore.swift
//  MajorityVoteApp
//
//  Created by tk84 on 2021/07/25.
//

import Foundation
import RealmSwift



struct VoteCategoryDataStore {
    
    private var realm: Realm!
    private var voteCategoriesRealm: Results<VoteCategory>!
    
    init() {
        self.realm = AppDelegate.database.getConnection()
        self.voteCategoriesRealm = realm.objects(VoteCategory.self)
    }
        
    
    func fetchAll() -> Results<VoteCategory> {
        return voteCategoriesRealm
    }
    
    func add(_ category: VoteCategory) {
        try! realm.write {
            realm.add(category)
        }
    }

    func update(category: VoteCategory, name: String) {
        let id = category.id
        let category = voteCategoriesRealm.filter("id == %@", id).last!
        
        try! realm.write {
            category.id = id
            category.name = name
        }
    }
    
    func delete(category: VoteCategory) {
        let id = category.id
        let category = voteCategoriesRealm.filter("id == %@", id).last!
        
        try! realm.write {
            realm.delete(category)
        }
    }
    
}

