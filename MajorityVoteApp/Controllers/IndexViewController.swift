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
        
        model = VoteIndexModel(dataStore: VoteCategoryDataStore(), view: self)
        tableDataList = model.voteCategories
        
    }
    
    
    @IBAction func tempAction(_ sender: Any) {
        
//        let category = tableDataList.last!
//        print(category)
//        //category.name = "hogehoge"
//        model.updateVoteCategory(category: category, name: "hogehoge")
        
//        let category = tableDataList.last!
//        model.deleteVoteCategory(category: category)
        //model.addVoteCategory(category: VoteCategory(name: "temp category"))
        
        let touchCategory = tableDataList.first!
        
        let showView = self.storyboard?.instantiateViewController(withIdentifier: "ShowViewController") as! ShowViewController
        let model = VoteShowModel(dataStore: VoteItemDataStore(category: touchCategory), view: showView, voteCategory: touchCategory)
        
        let counterView = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Counter") as! CounterViewController)
        let graphView = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Graph") as! GraphViewController)
        
        showView.voteCategory = touchCategory
        counterView.model = model
        graphView.model = model
        
        showView.setViewController(counterView: counterView, graphView: graphView)
        
        self.navigationController?.pushViewController(showView, animated: true)
    }
    
    func reloadTableView(categories: [VoteCategory]) {
        tableDataList = categories
        print("reload view")
    }
}
