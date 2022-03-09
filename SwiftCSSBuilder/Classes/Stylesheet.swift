//
//
//  Stylesheet.swift
//
//  Created on 03/03/22
//  Copyright (c) 2022 Marco Siino. All rights reserved.
//


import Foundation

extension CSS {
    public struct Stylesheet {
        private var styles = [Style]()
        
        public init(_ styles: [Style]) {
            self.styles = styles
        }
        
        public init() {
            self.styles = [Style]()
        }
        
        @discardableResult public func with(_ style: Style) -> Stylesheet {
            var styles = self.styles
            styles.append(style)
            return Stylesheet(styles)
        }
        
        public func toString() -> String {
            var str = ""
            for style in styles {
                str.append(style.toString() + "\n\n")
            }
            
            return str
        }
    }
}


