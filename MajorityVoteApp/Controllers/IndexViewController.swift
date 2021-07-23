//
//  ViewController.swift
//  MajorityVoteApp
//
//  Created by tk84 on 2021/07/18.
//

import UIKit
import RealmSwift

class IndexViewController: UIViewController {
    
    
    var model: VoteIndexModel!
    private var tableDataList: [VoteCategory]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "多数決一覧"
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        model = VoteIndexModel(dataStore: VoteCategoryDataStore(), view: self)
        tableDataList = model.getArrayCategories()
        
        print("table: \(tableDataList)")
        
    }
    
    
    @IBAction func tempAction(_ sender: Any) {
        
//        let category = tableDataList.last!
//        print(category)
//        //category.name = "hogehoge"
//        model.updateVoteCategory(category: category, name: "hogehoge")
        
        let category = tableDataList.last!
        model.deleteVoteCategory(category: category)
        //model.addVoteCategory(category: VoteCategory(name: "temp category"))
    }
    
    func reloadTableView(categories: [VoteCategory]) {
        tableDataList = categories
        print("reload view")
    }
}
