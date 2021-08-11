//
//  AddItemAlert.swift
//  MajorityVoteApp
//
//  Created by tk84 on 2021/08/11.
//

import UIKit

class AddItemAlert {
    var name: String!
    var model: VoteShowModel!
    var view: UIViewController!
    
    init(view: UIViewController, name: String, model: VoteShowModel) {
        self.name = name
        self.model = model
        self.view = view
    }
    
    init(view: UIViewController, model: VoteShowModel) {
        self.name = "temp"
        self.model = model
        self.view = view
    }
    
    public func createItemAlert() {
        var alertTextField: UITextField?
        
        let alert = UIAlertController(
            title: "Itemを追加します",
            message: "",
            preferredStyle: UIAlertController.Style.alert)
        alert.addTextField(
            configurationHandler: {(textField: UITextField!) in
                alertTextField = textField
                textField.text = self.name
            })
        let cancelAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler: nil)
        
        let okAction = UIAlertAction(title: "追加", style: UIAlertAction.Style.default) { _ in
            if let text = alertTextField?.text {
                self.model.addVoteItem(item: VoteItem(name: text))
            }
        }
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        view.present(alert, animated: true)
    }
}
