//
//
//  Selectors.swift
//
//  Created on 03/03/22
//  Copyright (c) 2022 Marco Siino. All rights reserved.
//


import Foundation

extension CSS {    
    public enum Selector {
        //Elements
        case all
        case html
        case body
        case p
        case a
        case div
        case span
        
        //Other
        case identifier(_ name: String)
        case `class`(_ name: String)
        case custom(_ selector: String)
        
        public func withClass(_ name: String) -> Selector {
            return .custom(self.toString() + "." + name)
        }
        
        public func withPseudoClass(_ name: String) -> Selector {
            return .custom(self.toString() + ":" + name)
        }
        
        public func withAttribute(_ name: String) -> Selector {
            return .custom(self.toString() + "[" + name + "]")
        }
        
        public func withAttribute(_ name: String, value: String) -> Selector {
            return .custom(self.toString() + "[\(name)=\(value)]")
        }
        
        public func insideOf(_ selector: Selector) -> Selector {
            return .custom(selector.toString() + " " + self.toString())
        }
        
        public func insideOf(_ name: String) -> Selector {
            return .custom(name + " " + self.toString())
        }
        
        public func childOf(_ selector: Selector) -> Selector {
            return .custom(selector.toString() + " > " + self.toString())
        }
        
        public func childOf(_ name: String) -> Selector {
            return .custom(name + " > " + self.toString())
        }
        
        func toString() -> String {
            switch self {
            case .all:
                return "*"
            case .html:
                return "html"
            case .body:
                return "body"
            case .p:
                return "p"
            case .a:
                return "a"
            case .div:
                return "div"
            case .span:
                return "span"
            case .identifier(let name):
                return "#\(name)"
            case .class(let name):
                return ".\(name)"
            case .custom(let selector):
                return selector
            }
        }
    }
}
