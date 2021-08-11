//
//  CounterViewController.swift
//  MajorityVoteApp
//
//  Created by tk84 on 2021/07/19.
//

import UIKit
import XLPagerTabStrip

class CounterViewController: UIViewController, IndicatorInfoProvider {
    
    var itemInfo: IndicatorInfo = "Counter"
    var model: VoteShowModel!
    private var tableDataList: [VoteItem]!
    let cellIdentifier = "ShowCellView"
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addItemButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableDataList = model.getVoteItems()
        self.view.backgroundColor = .showViewColor
        tableView.backgroundColor = .showViewColor
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        setupAddItemButton()
    }
    
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    
    func setupAddItemButton() {
        addItemButton.backgroundColor = .systemBlue.withAlphaComponent(0.5)
        addItemButton.layer.cornerRadius = addItemButton.frame.width / 2.0
        addItemButton.setTitleColor(.white.withAlphaComponent(0.7), for: .normal)
        addItemButton.layer.shadowOpacity = 0.6
        addItemButton.layer.shadowRadius = 5
    }
    
    @IBAction func tappedAddItemButton(_ sender: Any) {
        let alert = AddItemAlert(view: self, model: model)
        alert.createItemAlert()
    }
    
    
    func reloadView(voteCategory: VoteCategory) {
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
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        let voteItem = tableDataList[indexPath.section]
        cell.setValue(voteItem: voteItem, delegate: self)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tap")
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        model.deleteVoteItem(item: tableDataList[indexPath.section])
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
