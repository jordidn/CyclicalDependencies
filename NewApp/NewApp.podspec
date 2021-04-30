Pod::Spec.new do |s|
  s.name             = 'NewApp'
  s.version          = '0.1.0'
  s.summary          = 'NewApp Summary'
 
  s.description      = 'NewApp Description'
 
  s.homepage         = 'https://github.com/jordidn/NewApp'
  s.author           = { 'Jordi Duran' => 'jordiduran99@gmail.com' }
  s.source           = { :git => 'https://github.com/jordidn/NewApp.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '13.0'
  s.source_files = ['NewApp/IntegrationLayer/*.swift', 'NewApp/Features/*/*.swift', 'NewApp/Features/*/*.storyboard', 'NewApp/Main.storyboard']

  
  # Dependencies
  s.dependency 'CommonApp'

end
