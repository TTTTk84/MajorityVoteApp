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
        
        tableDataList = model.getVoteItems()
        
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
        tableView.reloadData()
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
        cell.setValue(voteItem: voteItem,delegate: self)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected: \(tableDataList[indexPath.section])")
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

extension CounterViewController: ShowCellViewDelegate {
    func minusButtonChecked(cell: ShowCellView) {
        guard let indexPath = tableView.indexPath(for: cell) else {
            return
        }
        let voteItem = tableDataList[indexPath.section]
        model.updateCountVoteItem(item: voteItem,status: .minus)
        
    }
    
    func plusButtonChecked(cell: ShowCellView) {
        guard let indexPath = tableView.indexPath(for: cell) else {
            return
        }
        let voteItem = tableDataList[indexPath.section]
        model.updateCountVoteItem(item: voteItem,status: .plus)
        
    }
    
}
