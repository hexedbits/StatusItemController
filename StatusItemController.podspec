Pod::Spec.new do |s|
   s.name = 'StatusItemController'
   s.version = '1.1.0'
   s.license = 'MIT'

   s.summary = 'A "view controller" for menu bar Mac apps'
   s.homepage = 'https://github.com/hexedbits/StatusItemController'
   s.documentation_url = 'https://hexedbits.github.io/StatusItemController'
   s.social_media_url = 'https://twitter.com/jesse_squires'
   s.author = 'Jesse Squires'

   s.source = { :git => 'https://github.com/hexedbits/StatusItemController.git', :tag => s.version }
   s.source_files = 'Sources/*.swift'

   s.swift_version = '5.5'

   s.osx.deployment_target = '10.12'

   s.requires_arc = true
end
