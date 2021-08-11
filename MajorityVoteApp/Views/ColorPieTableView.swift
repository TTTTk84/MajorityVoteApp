//
//  ColorPieTable.swift
//  MajorityVoteApp
//
//  Created by tk84 on 2021/08/10.
//

import UIKit


class ColorPieTableView: UITableView {
    static let cellIdentifier = "ColorPieTableCellView"

    private let tableView: UITableView = UITableView()

//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    public func instance() -> UITableView {
        self.tableView.register(UINib(nibName: ColorPieTableView.cellIdentifier, bundle: nil), forCellReuseIdentifier: ColorPieTableView.cellIdentifier)
        self.tableView.backgroundColor = .showViewColor
        self.tableView.separatorStyle = .none
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        return self.tableView 
    }

}
