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
    
    var voteCategories: Results<VoteCategory>!
    private let dataStore: VoteCategoryDataStore
    private let view: IndexViewController
    
    
    init(dataStore: VoteCategoryDataStore, view: IndexViewController) {
        self.voteCategories = dataStore.fetchAll()
        self.dataStore = dataStore
        self.view = view
        self.realm = AppDelegate.database.getConnection()
        
        voteNotification()
    }
    
    func voteNotification() {
        token = voteCategories.observe { _ in
            self.view.reloadTableView(categories: self.getArrayCategories())
        }
    }
    
    func getArrayCategories() -> [VoteCategory] {
        return Array(voteCategories)
    }
    
    func addVoteCategory(category: VoteCategory) {
        dataStore.add(category)
        voteCategories = dataStore.fetchAll()
    }
    
    func updateVoteCategory(category: VoteCategory) {
        dataStore.update(category)
        voteCategories = dataStore.fetchAll()
    }
}
