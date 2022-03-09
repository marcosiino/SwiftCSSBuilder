//
//
//  Property.swift
//
//  Created on 03/03/22
//  Copyright (c) 2022 Marco Siino. All rights reserved.
//

import Foundation

extension CSS {
    
    public enum PropertyType {
        case color
        case fontFamily
        case fontSize
        case lineSpacing
        case margin
        case marginTop
        case marginBottom
        case marginLeft
        case marginRight
        case padding
        case paddingTop
        case paddingBottom
        case paddingLeft
        case paddingRight
        case custom(_ name: String)
        
        func toString() -> String {
            switch self {
            case .color:
                return "color"
            case .fontFamily:
                return "font-family"
            case .fontSize:
                return "font-size"
            case .lineSpacing:
                return "line-spacing"
            case .margin:
                return "margin"
            case .marginTop:
                return "margin-top"
            case .marginBottom:
                return "margin-bottom"
            case .marginLeft:
                return "margin-left"
            case .marginRight:
                return "margin-right"
            case .padding:
                return "padding"
            case .paddingTop:
                return "padding-top"
            case .paddingBottom:
                return "padding-bottom"
            case .paddingLeft:
                return "padding-left"
            case .paddingRight:
                return "padding-right"
            case .custom(let name):
                return name
            }
        }
    }
    
    public enum PropertyValue {
        case custom(value: String)
        case px(_ value1: Int, _ value2: Int? = nil, _ value3: Int? = nil, _ value4: Int? = nil)
        case pt(_ value1: Double, _ value2: Double? = nil, _ value3: Double? = nil, _ value4: Double? = nil)
        case em(_ value1: Double, _ value2: Double? = nil, _ value3: Double? = nil, _ value4: Double? = nil)
        case perc(_ value1: Double, _ value2: Double? = nil, _ value3: Double? = nil, _ value4: Double? = nil)
        case color(_ value: UIColor)
        case RGB(_ red: Int, _ green: Int, _ blue: Int)
        case RGBA(_ red: Int, _ green: Int, _ blue: Int, _ alpha: Int)
        case fRGB(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat)
        case fRGBA(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat)
        case fontFamily(_ font: UIFont, fallbackFonts: [String]? = nil)
        case fontSize(_ font: UIFont)
        
        private func stringForValues<T>(withUnit unit: String, value1: T, value2: T? = nil, value3: T? = nil, value4: T? = nil) -> String {
            var str = "\(value1)\(unit)"
            if let value2 = value2 {
                str += " \(value2)\(unit)"
            }
            if let value3 = value3, let value4 = value4 {
                str += " \(value3)\(unit) \(value4)\(unit)"
            }
            return str
        }
        
        func toString() -> String {
            switch self {
            case .custom(let value):
                return value
            case .px(let value1, let value2, let value3, let value4):
                return stringForValues(withUnit: "px", value1: value1, value2: value2, value3: value3, value4: value4)
            case .pt(let value1, let value2, let value3, let value4):
                return stringForValues(withUnit: "pt", value1: value1, value2: value2, value3: value3, value4: value4)
            case .em(let value1, let value2, let value3, let value4):
                return stringForValues(withUnit: "em", value1: value1, value2: value2, value3: value3, value4: value4)
            case .perc(let value1, let value2, let value3, let value4):
                return stringForValues(withUnit: "%", value1: value1, value2: value2, value3: value3, value4: value4)
            case .color(let color):
                return "#\(color.toHex())"
            case .RGB(let r, let g, let b):
                let color = UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
                return "#\(color.toHex())"
            case .RGBA(let r, let g, let b, let a):
                let color = UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: CGFloat(a)/255.0)
                return "#\(color.toHex())"
            case .fRGB(let r, let g, let b):
                let color = UIColor(red: r, green: g, blue: b, alpha: 1.0)
                return "#\(color.toHex())"
            case .fRGBA(let r, let g, let b, let a):
                let color = UIColor(red: r, green: g, blue: b, alpha: a)
                return "#\(color.toHex())"
            case .fontFamily(let font, let fallbackFonts):
                var fonts = "\"\(font.fontName)\""
                if let fallbackFonts = fallbackFonts {
                    for font in fallbackFonts {
                        fonts.append(", \(font)")
                    }
                }
                return fonts
            case .fontSize(let font):
                return "\(font.pointSize)pt"
            }
        }
    }
    
    public struct Property {
        private var property: PropertyType
        private var value: PropertyValue
        
        public init(property: PropertyType, value: PropertyValue) {
            self.property = property
            self.value = value
        }
        
        internal func toString() -> String {
            return "\(property.toString()): \(value.toString());"
        }
    }
}
