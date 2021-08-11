//
//  IndexCell.swift
//  MajorityVoteApp
//
//  Created by tk84 on 2021/07/26.
//

import UIKit

class IndexCellView: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupLayout()
        createShadowView()
    }
    
    private func setupLayout() {
        
        self.backgroundColor = UIColor.showViewColor
        
        self.cellView.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        self.cellView.layer.cornerRadius = 10
        
        self.label.textColor = UIColor.showViewColor
        self.label.font = UIFont.italicSystemFont(ofSize: 20.0)
    }
    
    private func createShadowView() {
        
        let shadowView = UIView.init(frame: CGRect(
                                        x: cellView.frame.minX, y: cellView.frame.minY, width: cellView.frame.width, height: cellView.frame.height))
        shadowView.backgroundColor = UIColor.showViewColor
        shadowView.layer.cornerRadius = 10
        shadowView.layer.shadowOpacity = 0.3
        shadowView.layer.shadowRadius = 5
        shadowView.layer.shadowPath = UIBezierPath(
            roundedRect: CGRect(
                x: 7, y: 7, width: shadowView.frame.width, height: shadowView.frame.height),
            byRoundingCorners: .allCorners,
            cornerRadii: CGSize(width: 10, height: 10)).cgPath
        
        self.addSubview(shadowView)
        self.sendSubviewToBack(shadowView)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
