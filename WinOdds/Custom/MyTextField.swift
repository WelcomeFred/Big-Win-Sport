//
//  MyTextField.swift
//  WinOdds
//
//  Created by Ֆրեդ on 7/23/19.
//  Copyright © 2019 Ֆրեդ. All rights reserved.
//

import UIKit

@IBDesignable

class MyTextField: UITextField {

    @IBInspectable var CornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = CornerRadius
        }
    }
    @IBInspectable var BorderColor: UIColor = .blue {
        didSet {
            layer.borderColor = BorderColor.cgColor
        }
    }
    @IBInspectable var BorderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = BorderWidth
        }
    }
    
    
}
