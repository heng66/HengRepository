#
# Be sure to run `pod lib lint GDTAd.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GDTAd'
  s.version          = '1.0'
  s.summary          = '腾讯广点通广告'
  s.description      = '腾讯广点通广告集成'
  s.homepage         = 'https://github.com/chenqg365/GDTAd'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'heng66' => 'chenqg3721@gmail.com' }
  s.source           = { :git => 'https://github.com/heng66/GDTAd.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'GDTAd/**/*h'
  s.ios.frameworks = 'AdSupport', 'CoreLocation', 'QuartzCore', 'SystemConfiguration', 'CoreTelephony', 'Security', 'StoreKit', 'AVFoundation', 'WebKit'
  s.ios.libraries = "xml2","z"
  s.vendored_libraries = 'GDTAd/libGDTMobSDK.a'
  
end
