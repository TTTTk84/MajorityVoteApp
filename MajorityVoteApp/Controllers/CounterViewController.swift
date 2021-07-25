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
    var voteCategory: VoteCategory!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        voteCategory = model.voteCategory
        
//        let item = voteCategory.items.last!
//        model.deleteVoteItem(item: item)
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    
    func reloadView(voteCategory: VoteCategory) {
        print("update CounterView: \(voteCategory)")
        self.voteCategory = voteCategory
    }
    
}
