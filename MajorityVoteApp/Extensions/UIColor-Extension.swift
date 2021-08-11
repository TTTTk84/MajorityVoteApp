//
//  UIColor-Extension.swift
//  MajorityVoteApp
//
//  Created by tk84 on 2021/08/09.
//

import UIKit

extension UIColor {
    
    static let indexViewColor = UIColor(red: 0.40, green: 0.69, blue: 0.71, alpha: 1.00)
    static let showViewColor = UIColor(red: 0.61, green: 0.56, blue: 0.74, alpha: 1.00)
    
    static func getPieUIColors() -> [UIColor] {
        let pieColors = [
            UIColor.red,UIColor.blue,UIColor.green,UIColor.yellow,UIColor.black,UIColor.red,UIColor.blue,UIColor.green,UIColor.yellow,UIColor.black
        ]
        
        return pieColors
    }
    
    static func getPieCGColors() -> [CGColor] {
        let pieColors = [UIColor.red.cgColor,UIColor.blue.cgColor,UIColor.green.cgColor,UIColor.yellow.cgColor,UIColor.black.cgColor,UIColor.red.cgColor,UIColor.blue.cgColor,UIColor.green.cgColor,UIColor.yellow.cgColor,UIColor.black.cgColor]
        
        return pieColors
    }
}
