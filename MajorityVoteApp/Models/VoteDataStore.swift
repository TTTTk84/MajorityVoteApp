//
//  VoteDataStore.swift
//  MajorityVoteApp
//
//  Created by tk84 on 2021/07/20.
//

import UIKit
import RealmSwift


struct VoteCategoryDataStore {
    private var realm: Realm = AppDelegate.database.getConnection()
        
    
    func fetchAll() -> Results<VoteCategory> {
        let categories = realm.objects(VoteCategory.self)
        return categories
    }
    
    func add(_ category: VoteCategory) {
        try! realm.write {
            realm.add(category)
        }
    }

    func update(category: VoteCategory, name: String) {
        let id = category.id
        let result = realm.objects(VoteCategory.self).filter("id == %@", id).last!
        
        try! realm.write {
            result.id = id
            result.name = name
        }
    }
    
    func delete(category: VoteCategory) {
        let id = category.id
        let result = realm.objects(VoteCategory.self).filter("id == %@", id).last!
        
        try! realm.write {
            realm.delete(result)
        }
    }
    
}


struct VoteItemDataStore {
    private var realm: Realm = AppDelegate.database.getConnection()
        
    func fetchAll() -> Results<VoteCategory> {
        let categories = realm.objects(VoteCategory.self)
        return categories
    }
    
    func add(_ category: VoteCategory) {
        try! realm.write {
            realm.add(category)
        }
    }

    func update(category: VoteCategory, name: String) {
        let id = category.id
        let result = realm.objects(VoteCategory.self).filter("id == %@", id).last!
        
        try! realm.write {
            result.id = id
            result.name = name
        }
    }
    
    func delete(category: VoteCategory) {
        let id = category.id
        let result = realm.objects(VoteCategory.self).filter("id == %@", id).last!
        
        try! realm.write {
            realm.delete(result)
        }
    }
    
}
