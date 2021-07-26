//
//  CounterViewController.swift
//  MajorityVoteApp
//
//  Created by tk84 on 2021/07/19.
//

import UIKit
import XLPagerTabStrip

class CounterViewController: UIViewController, IndicatorInfoProvider {
    
    var itemInfo: IndicatorInfo = "カウンター"
    var model: VoteShowModel!
    private var tableDataList: [VoteItem]!
    let cellIdentifier = "ShowCellView"

    @IBOutlet weak var tableView: UITableView!
    //var voteCategory: VoteCategory!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableDataList = Array(model.voteCategory.items)
        
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    
    func reloadView(voteCategory: VoteCategory) {
        print("update CounterView")
        self.tableDataList = Array(voteCategory.items)
    }
    
}

extension CounterViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableDataList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! ShowCellView
        
        let voteItem = tableDataList[indexPath.section]
        cell.label.text = voteItem.name
        
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
    }
    
}


extension CounterViewController: UITableViewDelegate {
    
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

