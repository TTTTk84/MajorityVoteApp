//
//  ShowViewController.swift
//  MajorityVoteApp
//
//  Created by tk84 on 2021/07/18.
//

import UIKit
import XLPagerTabStrip


class ShowViewController: ButtonBarPagerTabStripViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "きのこ派たけのこ派"
        
        
        
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        //管理されるViewControllerを返す処理
        let firstVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Counter")
        let secondVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Graph")
        let childViewControllers:[UIViewController] = [firstVC, secondVC]
        return childViewControllers
    }
    
}
