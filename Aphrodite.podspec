Pod::Spec.new do |s|

  s.name         = "Aphrodite"
  s.version      = "1.2.0"
  s.summary      = "Aphrodite . It is a regular expression used on iOS, which implement by Swift"

  s.description  = <<-DESC
                Aphrodite . It is a regular expression used on iOS, which implement by Swift.
	        I hope that every person who uses it can harvest love. It provides you a chance to use a pure-Swift alternative in your next app.
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

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }
end




