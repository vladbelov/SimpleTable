Pod::Spec.new do |spec|
  spec.name         = "SimpleTable"
  spec.version      = "0.0.1"
  spec.summary      = "The most simple table manager for swift!"

  spec.description  = <<-DESC
This CocoaPods library helps you manage Table View.
                   DESC

  spec.homepage     = "https://github.com/vladbelov/SimpleTable"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Vladislav Belov" => "com.belov@gmail.com" }

  spec.ios.deployment_target = "12.1"
  spec.swift_version = "4.2"

  spec.source        = { :git => "https://github.com/vladbelov/SimpleTable.git", :tag => "#{spec.version}" }
  spec.source_files  = "SimpleTable/**/*.{h,m,swift}"
end
