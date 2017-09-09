Pod::Spec.new do |s|

  s.name         = "Aphrodite"
  s.version      = "1.1.1"
  s.summary      = "Aphrodite . It is a regular expression used on iOS, which implement by Swift"

  s.description  = <<-DESC
                Aphrodite . It is a regular expression used on iOS, which implement by Swift
		这是一个基于swift快捷开发的扩展类，目前的涵盖内容包括详细打印，正则表达式，会经常维护
                这是一个基于swift快捷开发的扩展类，目前的涵盖内容包括详细打印，正则表达式，会经常维护
                   DESC

  s.homepage     = "https://github.com/AnneBlair/Aphrodite"


  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.authors            = { "YinYu" => "sirbliar@gmail.com" }
  #s.social_media_url   = "http://twitter.com/YinYu"

  s.ios.deployment_target = "8.0"
 #s.tvos.deployment_target = "9.0"
 #s.osx.deployment_target = "10.10"
 #s.watchos.deployment_target = "2.0"

  s.source       = { :git => "https://github.com/AnneBlair/Aphrodite.git", :tag => s.version }

  s.source_files  = "Aphrodite/*.{h,swift}"
  s.public_header_files = "Aphrodite/Aphrodite.h"

  s.requires_arc = true

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.0' }
end




