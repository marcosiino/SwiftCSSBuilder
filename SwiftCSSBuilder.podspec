#
# Be sure to run `pod lib lint SwiftCSSBuilder.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftCSSBuilder'
  s.version          = '0.1.0'
  s.summary          = 'A Swift library to build Cascading Style Sheets (CSS) in Swift language with builtin UIKit support.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
SwiftCSSBuilder is a Swift library to easily build Cascading Style Sheets (CSS) in Swift language.
You can specify CSS properties by hand or use built in enums to specify CSS properties, selectors, and more. 
You can even pass UIColor to CSS properties like background-color or UIFonts to CSS property font-family or font-size!
                       DESC

  s.homepage         = 'https://github.com/marcosiino/SwiftCSSBuilder'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Marco Siino' => 'siino.marco@gmail.com' }
  s.source           = { :git => 'https://github.com/marcosiino/SwiftCSSBuilder.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'SwiftCSSBuilder/Classes/**/*'
  
  s.swift_versions = '5.0'
  
  # s.resource_bundles = {
  #   'SwiftCSSBuilder' => ['SwiftCSSBuilder/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
