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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
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
