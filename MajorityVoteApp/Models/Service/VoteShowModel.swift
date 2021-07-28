//
//  VoteShowModel.swift
//  MajorityVoteApp
//
//  Created by tk84 on 2021/07/20.
//


import Foundation
import RealmSwift

class VoteShowModel {
    private var realm: Realm!
    private var token: NotificationToken!
    
    var voteCategoryRealm: Results<VoteCategory>!
    var voteCategory: VoteCategory?
    private let dataStore: VoteItemDataStore
    private let view: ShowViewController
    
    
    init(dataStore: VoteItemDataStore, view: ShowViewController, voteCategory: VoteCategory) {
        self.realm = AppDelegate.database.getConnection()
        self.voteCategoryRealm = dataStore.fetchItems()
        self.voteCategory = self.voteCategoryRealm.last
        
        self.dataStore = dataStore
        self.view = view
        
        voteNotification()
    }
    
    func voteNotification() {
        token = voteCategoryRealm.observe { _ in
            self.voteCategory = self.voteCategoryRealm.last
            self.view.reloadViews(voteCategory: self.voteCategory!)
        }
    }
    
    func getVoteItems() -> [VoteItem] {
        return Array(voteCategory!.items)
    }

    func addVoteItem(item: VoteItem) {
        dataStore.add(item)
        voteCategoryRealm = dataStore.fetchItems()
    }

    func updateNameVoteItem(item: VoteItem, name: String) {
        dataStore.updateName(item: item, name: name)
        voteCategoryRealm = dataStore.fetchItems()
    }
    
    func updateCountVoteItem(item: VoteItem) {
        dataStore.updateCount(item: item)
        voteCategoryRealm = dataStore.fetchItems()
    }
    
    func deleteVoteItem(item: VoteItem) {
        dataStore.delete(item: item)
        voteCategoryRealm = dataStore.fetchItems()
    }

}
