//
//  ShowViewController.swift
//  MajorityVoteApp
//
//  Created by tk84 on 2021/07/18.
//

import UIKit
import XLPagerTabStrip


class ShowViewController: ButtonBarPagerTabStripViewController {
    
    var counterView: CounterViewController!
    var graphView: GraphViewController!
    var voteCategory: VoteCategory!
    
    override func viewDidLoad() {
        setupXLPagerTabStrip()
        super.viewDidLoad()
        
        self.navigationItem.title = voteCategory.name
    }
    
    func setupXLPagerTabStrip() {
        settings.style.buttonBarBackgroundColor = UIColor.showViewColor
        settings.style.buttonBarItemBackgroundColor = UIColor.showViewColor
        settings.style.selectedBarBackgroundColor = UIColor.white
    }
    
    func setViewController(counterView: CounterViewController,
                           graphView: GraphViewController) {
        self.counterView = counterView
        self.graphView = graphView
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let childViewControllers:[UIViewController] = [counterView, graphView]
        return childViewControllers
    }
    
    func reloadViews(voteCategory: VoteCategory) {
        counterView.reloadView(voteCategory: voteCategory)
        graphView.reloadView(voteCategory: voteCategory)
    }
    
}
