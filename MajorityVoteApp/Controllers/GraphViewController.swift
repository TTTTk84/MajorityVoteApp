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
    var voteCategory: VoteCategory!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        voteCategory = model.voteCategory
    }
    override func viewDidAppear(_ animated: Bool) {
        let screenSize: CGRect = UIScreen.main.bounds
        let widthValue = screenSize.width
        let drawWidth = widthValue * 0.8
        
        let pieChartView: PieChartView = PieChartView()
        self.view.addSubview(pieChartView)
        
        pieChartView.frame = CGRect(x: widthValue/2-drawWidth/2, y: 150, width: drawWidth, height: drawWidth)
        pieChartView.drawChart(items: voteCategory.itemCount())
    }
    
    //必須
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    
    
    func reloadView(voteCategory: VoteCategory) {
        print("update GraphView")
        self.voteCategory = voteCategory
    }
}
