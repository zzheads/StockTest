source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target 'StockTest' do
    pod 'Alamofire', '~> 4.7'
    pod 'PromiseKit', '~> 6.0'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '4.1.2'
        end
    end
end
