Pod::Spec.new do |s|
  s.name             = 'RSS'
  s.version          = '0.1.0'
  s.summary          = 'Parse and use RSS feed data'
  s.description      = <<-DESC
    Parse and use RSS feed data in Swift.
                       DESC
  s.homepage         = 'https://github.com/kiliankoe/RSS'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Kilian Koeltzsch' => 'me@kilian.io' }
  s.source           = { :git => 'https://github.com/kiliankoe/RSS.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/kiliankoe'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.11'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.dependency 'Kanna', '1.1'

  s.source_files = 'RSS/Classes/**/*'
end
