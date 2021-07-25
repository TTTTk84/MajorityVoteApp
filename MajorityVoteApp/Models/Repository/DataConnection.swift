//
//  File.swift
//  MajorityVoteApp
//
//  Created by tk84 on 2021/07/23.
//

import Foundation
import RealmSwift


class DataConnection {
    private var realm: Realm!
    
    init() {
        self.realm = try! Realm()
    }
    
    func getConnection() -> Realm {
        return self.realm
    }
    
}
