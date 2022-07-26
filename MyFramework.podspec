Pod::Spec.new do |s|
  s.name         = "MyFramework"
  s.version      = "1.0.0"
  s.summary      = "MyFramework library"

  s.description  = <<-DESC
  MyFramework is a sample framework
                   DESC

  s.homepage     = ""
  s.license      = { :type => 'Commercial', :text => '' }
  s.author       = "Quayle"

  s.source = { :path => '.' }

  s.platform     = :ios, '13.0'
  s.swift_version = '5'

  #s.source       = { :git => "http://EXAMPLE/HowtankWidget-Swift.git", :tag => "#{s.version}" }
  
  s.source_files  = "MyFramework/**/*.swift"
  s.resource_bundles = {
     'HowtankWidgetSwift' => ['MyFramework/**/*.xib','MyFramework/**/*.xcassets']
  }
  s.ios.deployment_target = '10.0'

end
