# SwiftCSSBuilder

[![Version](https://img.shields.io/cocoapods/v/SwiftCSSBuilder.svg?style=flat)](https://cocoapods.org/pods/SwiftCSSBuilder)
[![License](https://img.shields.io/cocoapods/l/SwiftCSSBuilder.svg?style=flat)](https://cocoapods.org/pods/SwiftCSSBuilder)
[![Platform](https://img.shields.io/cocoapods/p/SwiftCSSBuilder.svg?style=flat)](https://cocoapods.org/pods/SwiftCSSBuilder)

## Installation

### Using CocoaPods

```ruby
pod 'SwiftCSSBuilder'
```

## Basic Usage

With SwiftCSSBuilder you can build Cascading Style Sheets (CSS) by constructing them in swift language. See the following example:

```swift
let style = CSS.Stylesheet()
    .with(CSS.Style(for: .all)
            .property(.fontFamily, value: "Helvetica")
            .property(.fontSize, value: .pt(20))
            .property(.color, value: "#606060"))
    .with(CSS.Style(for: .class("cuteDiv"))
            .property("background-color", value: .color(UIColor.gray))
            .property(.padding, value: .px(20)))
    .with(CSS.Style(for: .p.childOf(.div.withClass("cuteDiv")))
            .property(.color, value: .color(.red)))
    
print(style.toString())
```

Which outputs the following CSS:

```css
* {
    font-family: Helvetica;
    font-size: 20.0pt;
    color: #606060;
}

.cuteDiv {
    background-color: #000000FF;
    padding: 20px;
}

div.cuteDiv > p {
    color: #FF0000FF;
}

```

You can specify properties by hand by specifing the CSS property name and value:

```swift
.property("margin-bottom", value: "1em")
```

Or you can use one of the build in enums in CSS.PropertyType for the property name, and an enum from CSS.PropertyValue for the value, for example:

```swift
.property(.marginBottom, value: .em(1))
```

Both will translate to the following CSS property:

```css
margin-bottom: 1em;
```

You can even use an hand written property name via String and use a builtin CSS.PropertyValue for the value:

```swift
.property("font-size", value: .pt(12))
```

Or, viceversa:

```swift
.property(.fontSize, value: "12pt")
```

## Passing UIKit types

You can use some UIKit types with SwiftCSSBuilder by passing them to specific CSS.PropertyValue, for example:

You can specify a CSS color property by passing an UIColor instance. SwiftCSSBuilder will take and translate the color from that UIColor instance:

```swift
.property(.color, value: .color(UIColor.red))
```

You can specify a CSS font related property by passing an UIFont instance. SwiftCSSBuilder will take the property value from that UIFont instance:

```swift
let font: UIFont = //A cool UIFont my app uses
.property(.fontFamily, value: .fontFamily(font)) //Takes the font-family from the specified UIFont
.property(.fontSize, value: .fontSize(font)) //Takes the font-size from the specified UIFont
```

You can also specify one or more fallback fonts for the font-family CSS property:

```swift
let font: UIFont = //A cool UIFont my app uses
.property(.fontFamily, value: .fontFamily(font, fallbackFonts: ["Arial", "sans-serif"])) //Takes the font-family from the specified UIFont and specifies Arial and sans-serif as fallback fonts 
```

## Built-in Property Values specifiers

As said in the previous paragraphs, you can specify both hand written properties or you can use the built-in CSS.PropertyType and CSS.PropertyValue enums to specify property names and value. The following is a list of some useful built-in CSS.PropertyValue specifiers:

### .color

Allows to specify a color-related property's value by using a UIColor instance. Example:

```swift
.property(.color, value: .color(UIColor.red))
```

### .RGB / .RGBA / .fRGB, .fRGBA

Allows to specify a color-related property's value by using Red, Green, Blue (and eventually Alpha) components as Int (0-255) or as CGFloat (0.0-1.0). Examples:

```swift
.property(.color, value: .RGB(255, 0, 0))
```

```swift
.property(.color, value: .RGBA(255, 0, 0, 255))
```

```swift
.property(.color, value: .fRGB(1.0, 0.0, 0.0))
```

```swift
.property(.color, value: .fRGBA(1.0, 0.0, 0.0, 1.0))
```

### .fontFamily

Allows to specify a font-family CSS property's value by using an UIFont. Example:

```swift
let font: UIFont = //Your UIFont instance
.property(.fontFamily, value: .fontFamily(font))
```

### .fontSize

Allows to specify a font-size CSS property's value by using an UIFont. Example:

```swift
let font: UIFont = //Your UIFont instance
.property(.fontSize, value: .fontSize(font))
```

### .px, .pt, .em, .perc

Allows to specify a generic CSS properties' values by using px, pt, em and percentual units. Example

```swift
.property(.marginTop, value: .px(10))
```

Translates to:

```css
margin-top: 10px;
```

Or you can specify 2 or 4 values:

```swift
.property(.margin, value: .px(10, 20))
.property(.padding, value: .em(10, 20, 30, 40))
```

Translates to:

```css
margin: 10px 20px;
padding: 10em 20em 30em 40em;
```

```swift
.property("font-size", value: .pt(12))
```

Translates to:

```css
font-size: 12pt;
```

```swift
.property("max-height", value: .perc(50))
```

Translates to:

```css
max-height: 50%;
```

## Example Project

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

SwiftCSSBuilder is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SwiftCSSBuilder'
```

## Author

Marco Siino, siino.marco@gmail.com

## License

SwiftCSSBuilder is available under the MIT license. See the LICENSE file for more info.
