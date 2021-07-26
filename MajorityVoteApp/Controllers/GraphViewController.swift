//
//  GraphViewController.swift
//  MajorityVoteApp
//
//  Created by tk84 on 2021/07/19.
//

import UIKit
import XLPagerTabStrip

class GraphViewController: UIViewController, IndicatorInfoProvider {
    
    var itemInfo: IndicatorInfo = "グラフ"
    var model: VoteShowModel!
    var voteCategory: VoteCategory!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        voteCategory = model.voteCategory
        
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
