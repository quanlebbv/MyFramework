Pod::Spec.new do |s|
  s.name         = "MyFramework"
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
  s.swift_version = '5'

  s.source       = { :git => "https://github.com/quanlebbv/MyFramework.git", :tag => "#{s.version}" }
  
  s.source_files = "MyFramework/**/*.{h,m,mm,swift}"
  s.resource_bundles = {
     'MyFramework' => ['MyFramework/**/*.xib','MyFramework/**/*.xcassets']
  }
  s.ios.deployment_target = '10.0'

end
