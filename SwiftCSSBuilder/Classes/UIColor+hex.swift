//
//
//  UIColor+hex.swift
//
//  Created on 03/03/22
//  Copyright (c) 2022 Marco Siino. All rights reserved.
//


import Foundation

extension UIColor {
    func toHex(withAlpha: Bool = true) -> String {
        guard let components = cgColor.components, components.count >= 3 else {
            if withAlpha {
                return "000000FF"
            }
            else {
                return "000000"
            }
        }
        
        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        
        if withAlpha == false {
            return String(format: "%02lX%02lX%02lX", lroundf(r * 255.0), lroundf(g * 255.0), lroundf(b * 255.0))
        }
        else {
            var a = Float(1.0)
            if components.count >= 4 {
                a = Float(components[3])
            }
            
            return String(format: "%02lX%02lX%02lX%02lX", lroundf(r * 255.0), lroundf(g * 255.0), lroundf(b * 255.0), lroundf(a * 255.0))
        }
    }
}
