//
//  GraphViewController.swift
//  MajorityVoteApp
//
//  Created by tk84 on 2021/07/19.
//

import UIKit
import XLPagerTabStrip

class GraphViewController: UIViewController, IndicatorInfoProvider {
    
    var itemInfo: IndicatorInfo = "Graph"
    var model: VoteShowModel!
    private var tableDataList: [VoteItem]!
    var voteCategory: VoteCategory!
    
    
    let widthValue = UIScreen.main.bounds.width
    let heightValue = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .showViewColor
        voteCategory = model.voteCategory
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupGraph()
    }
    
    func setupGraph() {

        let screenSize: CGRect = UIScreen.main.bounds
        let widthValue = screenSize.width
        let drawWidth = widthValue * 0.5
        
        let pieChartView: PieChartView = PieChartView()
        self.view.addSubview(pieChartView)
        pieChartView.frame = CGRect(x: widthValue/2-drawWidth/2, y: 50, width: drawWidth, height: drawWidth)
        pieChartView.drawChart(items: voteCategory.itemCount())
        
        
        let tableView = ColorPieTableView().instance()
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        tableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: pieChartView.bottomAnchor, constant: 50.0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50.0).isActive = true
        tableView.widthAnchor.constraint(equalToConstant: widthValue * 0.8).isActive = true
    }
    
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    
    
    func reloadView(voteCategory: VoteCategory) {
        print("update GraphView")
        self.voteCategory = voteCategory
        self.tableDataList = Array(voteCategory.items)
    }
}


extension GraphViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableDataList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ColorPieTableView.cellIdentifier) as! ColorPieTableCellView
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        let voteItem = tableDataList[indexPath.section]
        cell.setValue(item: voteItem, number: indexPath.section)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
}


extension GraphViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let marginView = UIView()
        marginView.backgroundColor = .clear  // 背景色を透過させる
        return marginView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
