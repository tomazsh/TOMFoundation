Pod::Spec.new do |s|
  s.name = 'TOMFoundation'
  s.version = '0.0.1'
  s.authors = {'Tomaz Nedeljko' => 'tomaz@nedeljko.com'}
  s.homepage = 'https://github.com/tomazsh/TOMFoundation'
  s.source = {:git => 'https://github.com/tomazsh/TOMFoundation.git', :tag => '0.0.1'}
  s.license = { :type => 'MIT', :file => 'LICENSE' }

  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.7'
  s.requires_arc = true
  s.frameworks = 'Foundation'
  s.source_files = 'TOMFoundation'
end