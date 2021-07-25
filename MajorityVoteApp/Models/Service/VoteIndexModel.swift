//
//  VoteIndexModel.swift
//  MajorityVoteApp
//
//  Created by tk84 on 2021/07/20.
//

import Foundation
import RealmSwift

class VoteIndexModel {
    private var realm: Realm!
    private var token: NotificationToken!
    
    var voteCategoriesRealm: Results<VoteCategory>!
    var voteCategories: [VoteCategory]!
    private let dataStore: VoteCategoryDataStore
    private let view: IndexViewController
    
    init(dataStore: VoteCategoryDataStore, view: IndexViewController) {
        self.voteCategoriesRealm = dataStore.fetchAll()
        self.voteCategories = Array(voteCategoriesRealm)
        self.dataStore = dataStore
        self.view = view
        self.realm = AppDelegate.database.getConnection()
        
        voteNotification()
    }
    
    func voteNotification() {
        token = voteCategoriesRealm.observe { _ in
            self.voteCategories = Array(self.voteCategoriesRealm)
            self.view.reloadTableView(categories: self.voteCategories)
        }
    }
    
    func addVoteCategory(category: VoteCategory) {
        dataStore.add(category)
        voteCategoriesRealm = dataStore.fetchAll()
    }
    
    func updateVoteCategory(category: VoteCategory, name: String) {
        dataStore.update(category: category, name: name)
        voteCategoriesRealm = dataStore.fetchAll()
    }
    
    func deleteVoteCategory(category: VoteCategory) {
        dataStore.delete(category: category)
        voteCategoriesRealm = dataStore.fetchAll()
    }

}
