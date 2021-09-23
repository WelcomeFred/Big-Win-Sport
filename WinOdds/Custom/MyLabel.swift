//
//  MyLabel.swift
//  WinOdds
//
//  Created by Ֆրեդ on 7/23/19.
//  Copyright © 2019 Ֆրեդ. All rights reserved.
//

import UIKit


@IBDesignable
class MyLabel: UILabel {
    
    @IBInspectable var shadowColorForCustom: UIColor = .clear
    @IBInspectable var shadowOffsetForCustom: CGSize = .zero
    @IBInspectable var shadowRadiusForCustom: CGFloat = 0.0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let text = text, let attributed = attributedText else { return }
        let mutable = NSMutableAttributedString(attributedString: attributed)
        let shadow = createShadow()
        let range = NSRange(location: 0, length: text.count)
        mutable.addAttribute(.shadow, value: shadow, range: range)
        attributedText = mutable
    }
    
    private func createShadow() -> NSShadow {
        let shadow = NSShadow()
        shadow.shadowColor = shadowColorForCustom
        shadow.shadowOffset = shadowOffsetForCustom
        shadow.shadowBlurRadius = shadowRadiusForCustom
        return shadow
    }
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
