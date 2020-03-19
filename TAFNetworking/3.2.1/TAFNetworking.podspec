Pod::Spec.new do |s|
  s.name                = 'TAFNetworking'
  s.version             = '3.2.1'
  s.license             = 'MIT'
  s.summary             = 'A delightful iOS and OS X networking framework.'
  s.homepage            = 'https://github.com/heng66/TAFNetworking'
  s.license             = { :type => 'MIT', :file => 'LICENSE' }
  s.author              = { 'heng66' => 'chenqg3721@gmail.com' }
  s.source              = { :git => 'https://github.com/heng66/TAFNetworking.git', :tag => s.version.to_s }
  s.requires_arc        = true
  
  s.public_header_files = 'TAFNetworking/AFNetworking.h'
  s.source_files        = 'TAFNetworking/AFNetworking.h'
  
  pch_AF = <<-EOS
#ifndef TARGET_OS_IOS
  #define TARGET_OS_IOS TARGET_OS_IPHONE
#endif

#ifndef TARGET_OS_WATCH
  #define TARGET_OS_WATCH 0
#endif

#ifndef TARGET_OS_TV
  #define TARGET_OS_TV 0
#endif
EOS
  s.prefix_header_contents = pch_AF
  
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'
  
  s.subspec 'Serialization' do |ss|
    ss.source_files = 'TAFNetworking/AFURL{Request,Response}Serialization.{h,m}'
    ss.public_header_files = 'TAFNetworking/AFURL{Request,Response}Serialization.h'
    ss.watchos.frameworks = 'MobileCoreServices', 'CoreGraphics'
    ss.ios.frameworks = 'MobileCoreServices', 'CoreGraphics'
    ss.osx.frameworks = 'CoreServices'
  end

  s.subspec 'Security' do |ss|
    ss.source_files = 'TAFNetworking/AFSecurityPolicy.{h,m}'
    ss.public_header_files = 'TAFNetworking/AFSecurityPolicy.h'
    ss.frameworks = 'Security'
  end

  s.subspec 'Reachability' do |ss|
    ss.ios.deployment_target = '8.0'
    ss.osx.deployment_target = '10.9'
    ss.tvos.deployment_target = '9.0'

    ss.source_files = 'TAFNetworking/AFNetworkReachabilityManager.{h,m}'
    ss.public_header_files = 'TAFNetworking/AFNetworkReachabilityManager.h'

    ss.frameworks = 'SystemConfiguration'
  end

  s.subspec 'NSURLSession' do |ss|
    ss.dependency 'TAFNetworking/Serialization'
    ss.ios.dependency 'TAFNetworking/Reachability'
    ss.osx.dependency 'TAFNetworking/Reachability'
    ss.tvos.dependency 'TAFNetworking/Reachability'
    ss.dependency 'TAFNetworking/Security'

    ss.source_files = 'TAFNetworking/AF{URL,HTTP}SessionManager.{h,m}', 'TAFNetworking/AFCompatibilityMacros.h'
    ss.public_header_files = 'TAFNetworking/AF{URL,HTTP}SessionManager.h', 'TAFNetworking/AFCompatibilityMacros.h'
  end

  s.subspec 'UIKit' do |ss|
    ss.ios.deployment_target = '8.0'
    ss.tvos.deployment_target = '9.0'
    ss.dependency 'TAFNetworking/NSURLSession'

    ss.public_header_files = 'UIKit+AFNetworking/*.h'
    ss.source_files = 'UIKit+AFNetworking'
  end
end
