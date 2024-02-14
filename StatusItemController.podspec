Pod::Spec.new do |s|
   s.name = 'StatusItemController'
   s.version = '2.0.1'
   s.license = 'MIT'

   s.summary = 'A "view controller" for menu bar Mac apps'
   s.homepage = 'https://github.com/hexedbits/StatusItemController'
   s.documentation_url = 'https://hexedbits.github.io/StatusItemController'
   s.social_media_url = 'https://www.jessesquires.com'
   s.author = 'Jesse Squires'

   s.source = { :git => 'https://github.com/hexedbits/StatusItemController.git', :tag => s.version }
   s.source_files = 'Sources/*.swift'

   s.swift_version = '5.9'
   s.osx.deployment_target = '11.0'
   s.requires_arc = true
end
