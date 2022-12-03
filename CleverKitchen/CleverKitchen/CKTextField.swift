//
//  CKTextField.swift
//  CleverKitchen
//
//  Created by Chandu on 30/11/22.
//

import Foundation
import UIKit

class CKTextField : UITextField {
        
    var padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 5)
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 5
        let leftBorder = CALayer()
        leftBorder.frame = CGRect(x: 0,y: 0,width: 5,height: self.frame.size.width)
        leftBorder.backgroundColor = UIColor(named: "BaseColor")?.cgColor
        borderStyle = .none
        self.layer.addSublayer(leftBorder)
        self.layer.masksToBounds = true
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

}
