//
//
//  Style.swift
//
//  Created on 03/03/22
//  Copyright (c) 2022 Marco Siino. All rights reserved.
//


import Foundation

extension CSS {
    
    public struct Style {
        private let selectors: [Selector]
        private var properties = [Property]()

        public init(`for` selector: Selector) {
            self.selectors = [selector]
        }
        
        public init(`for` selectors: [Selector]) {
            self.selectors = selectors
        }
        
        public init(`for` selector: Selector, properties: [Property]) {
            self.init(for: selector)
            self.properties = properties
        }
        
        public init(`for` selectors: [Selector], properties: [Property]) {
            self.init(for: selectors)
            self.properties = properties
        }
        
        @discardableResult public func property(_ prop: PropertyType, value: PropertyValue) -> Style {
            var properties = self.properties
            properties.append(Property(property: prop, value: value))
            return Style(for: selectors, properties: properties)
        }
        
        @discardableResult public func property(_ prop: PropertyType, value: String) -> Style {
            return property(prop, value: .custom(value: value))
        }
        
        @discardableResult public func property(_ customProperty: String, value: String) -> Style {
            return property(.custom(customProperty), value: .custom(value: value))
        }
        
        @discardableResult public func property(_ customProperty: String, value: PropertyValue) -> Style {
            return property(.custom(customProperty), value: value)
        }
        
        internal func toString() -> String {
            let selectorsStr = selectors.map { $0.toString() }.joined(separator: ", ")
            var str = "\(selectorsStr) {\n"
            for prop in properties {
                str.append("\t" + prop.toString() + "\n")
            }
            str.append("}")
            
            return str
        }
    }
}
