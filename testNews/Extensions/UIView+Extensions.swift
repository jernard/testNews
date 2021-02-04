//
//  UIView+Extensions.swift
//  testNews
//
//  Created by Jernard Ducon on 4/02/21.
//

import UIKit

@IBDesignable extension UIView {
    
    @IBInspectable
    var borderColor: UIColor? {
        set {
            layer.borderColor = newValue?.cgColor
            layer.masksToBounds = true
        }
        get {
            guard let color = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
            layer.masksToBounds = true
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = true
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        set {
            layer.shadowRadius = newValue
            layer.masksToBounds = true
        }
        get {
            return layer.shadowRadius
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        set {
            layer.shadowOpacity = newValue
            layer.masksToBounds = true
        }
        get {
            return layer.shadowOpacity
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        set {
            layer.shadowOffset = newValue
            layer.masksToBounds = true
        }
        get {
            return layer.shadowOffset
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
                layer.masksToBounds = true
            } else {
                layer.shadowColor = nil
            }
        }
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        
    }
}
