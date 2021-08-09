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
    let cellIdentifier = "IndexCellView"
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        
        tableView.backgroundColor = .indexViewColor
        
        model = VoteIndexModel(dataStore: VoteCategoryDataStore(), view: self)
        tableDataList = model.voteCategories
        
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        
        
        
    }
    
    private func setupNavigationBar() {
        self.navigationItem.title = "Mojority Vote App"
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont(name: "Avenir-Heavy", size: 20)!
        ]
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    
    
    func reloadTableView(categories: [VoteCategory]) {
        tableDataList = categories
        print("reload view")
    }
}


extension IndexViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableDataList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! IndexCellView
        
        let voteCategory = tableDataList[indexPath.section]
        cell.label.text = voteCategory.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let touchCategory = tableDataList[indexPath.section]
        
        let showView = self.storyboard?.instantiateViewController(withIdentifier: "ShowViewController") as! ShowViewController
        let model = VoteShowModel(dataStore: VoteItemDataStore(category: touchCategory), view: showView, voteCategory: touchCategory)
        
        let counterView = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Counter") as! CounterViewController)
        let graphView = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Graph") as! GraphViewController)
        
        showView.voteCategory = touchCategory
        counterView.model = model
        graphView.model = model
        
        showView.setViewController(counterView: counterView, graphView: graphView)
        
        self.navigationController?.pushViewController(showView, animated: true)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


extension IndexViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let marginView = UIView()
        marginView.backgroundColor = .clear  // 背景色を透過させる
        return marginView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


