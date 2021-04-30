Pod::Spec.new do |s|
    s.name             = 'CommonApp'
    s.version          = '0.1.0'
    s.summary          = 'NewApp Summary'
   
    s.description      = 'CommonApp Description'
   
    s.homepage         = 'https://github.com/jordidn/CommonApp'
    s.author           = { 'Jordi Duran' => 'jordiduran99@gmail.com' }
    s.source           = { :git => 'https://github.com/jordidn/CommonApp.git', :tag => s.version.to_s }
   
    s.ios.deployment_target = '13.0'
    s.source_files = ['CommonApp/IntegrationLayer/*.swift', 'CommonApp/Features/*/*.swift']
  
  end
