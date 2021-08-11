//
//  ShowCellView.swift
//  MajorityVoteApp
//
//  Created by tk84 on 2021/07/26.
//

import UIKit


protocol ShowCellViewDelegate: AnyObject {
    func minusButtonChecked(cell: ShowCellView)
    func plusButtonChecked(cell: ShowCellView)
}

class ShowCellView: UITableViewCell {
    
    var delegate: ShowCellViewDelegate?
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
        setupButton(minusButton)
        setupButton(plusButton)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupLayout() {
        self.backgroundColor = .showViewColor
        self.cellView.backgroundColor = .white.withAlphaComponent(0.7)
        self.cellView.layer.cornerRadius = 10
        
        self.label.textColor = .showViewColor
        self.label.font = UIFont.italicSystemFont(ofSize: 20.0)
        
        self.countLabel.textColor = .showViewColor
    }
    
    func setupButton(_ button: UIButton) {
        button.backgroundColor = .showViewColor.withAlphaComponent(0.5)
        button.layer.cornerRadius = 25
        
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 5
        
    }
    
    func setValue(voteItem: VoteItem,delegate: ShowCellViewDelegate) {
        label.text = voteItem.name
        countLabel.text = String(voteItem.count)
        self.delegate = delegate
    }
    
    @IBAction func changeMinusButton(_ sender: Any) {
        delegate?.minusButtonChecked(cell: self)
    }
    
    @IBAction func changePlusButton(_ sender: Any) {
        delegate?.plusButtonChecked(cell: self)
    }
    
}
