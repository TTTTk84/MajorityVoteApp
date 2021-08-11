//
//  ColorPieTableCellView.swift
//  MajorityVoteApp
//
//  Created by tk84 on 2021/08/10.
//

import UIKit

class ColorPieTableCellView: UITableViewCell {

    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupLayout() {
        let oneSize = cellView.frame.height * 0.5
        
        backgroundColor = .showViewColor
        cellView.backgroundColor = .white.withAlphaComponent(0.7)
        cellView.layer.cornerRadius = 10
        
        nameLabel.textColor = .showViewColor
        nameLabel.font = UIFont.italicSystemFont(ofSize: 20.0)
        
        colorLabel.translatesAutoresizingMaskIntoConstraints = false
        colorLabel.layer.masksToBounds = true
        colorLabel.widthAnchor.constraint(equalToConstant: oneSize).isActive = true
        colorLabel.heightAnchor.constraint(equalToConstant: oneSize).isActive = true
        colorLabel.layer.cornerRadius = oneSize / 2.0
    }
    
    
    func setValue(item: VoteItem, number: Int) {
        let pieColors = UIColor.getPieUIColors()
        nameLabel.text = item.name
        colorLabel.backgroundColor = pieColors[number]
    }
    
}
