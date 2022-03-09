//
//  ViewController.swift
//  SwiftCSSBuilder
//
//  Created by Marco Siino on 03/08/2022.
//  Copyright (c) 2022 Marco Siino. All rights reserved.
//

import UIKit
import SwiftCSSBuilder
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let style = CSS.Stylesheet()
            .with(CSS.Style(for: .all)
                    .property(.fontFamily, value: "Helvetica")
                    .property(.fontSize, value: .pt(20))
                    .property(.color, value: "#606060"))
            .with(CSS.Style(for: .class("cuteDiv"))
                    .property("background-color", value: "#eeeeee")
                    .property(.padding, value: .px(20)))
            .with(CSS.Style(for: .p.childOf(.div.withClass("cuteDiv")))
                    .property(.color, value: .color(.red)))
            .with(CSS.Style(for: .a)
                    .property(.color, value: .color(.blue)))
            .with(CSS.Style(for: .p)
                    .property(.marginTop, value: .em(1.5)))
        
        var htmlStr = "<style>\(style.toString())</style>"
        htmlStr.append("<p>This is a paragraph with <strong>bold text</strong>. This is <span>a span</span></p>")
        htmlStr.append("<p>This is another paragraph with <a href=\"https://www.google.it\">a link</a></p>")
        htmlStr.append("<div><p>This is paragraph inside a div</p></div>")
        htmlStr.append("<div class=\"cuteDiv\"><h1>Div header</h1><p>This is paragraph inside a div.cuteDiv</p></div>")
        webView.loadHTMLString(htmlStr, baseURL: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

