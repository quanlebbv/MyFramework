Pod::Spec.new do |s|
  s.name         = "MyDemoFramework"
  s.version      = "1.0.0"
  s.summary      = "MyFramework library"
  s.description  = <<-DESC
  MyFramework is a sample framework
                   DESC

  s.homepage     = ""
  s.license      = { :type => 'Commercial', :text => '' }
  s.author       = "Quanle"
  s.source = { :path => '.' }
  s.platform     = :ios, '13.0'
  s.swift_version = '5.3'
  s.source       = { :git => "https://github.com/quanlebbv/MyFramework.git", :tag => "#{s.version}" }
  s.ios.deployment_target = '10.0'
  vendored_frameworks = "MyFramework.xcframework"
end
