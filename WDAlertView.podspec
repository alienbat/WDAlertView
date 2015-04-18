Pod::Spec.new do |spec|
  spec.name             = 'WDAlertView'
  spec.version          = '1.0.0'
  spec.license          = { :type => 'MIT' }
  spec.homepage         = 'https://github.com/alienbat/WDAlertView'
  spec.authors          = { 'Jian Shen' => 'alienbat@gmail.com' }
  spec.summary          = 'Alert view that supports block handling'
  spec.source           = { :git => 'git@github.com:alienbat/WDAlertView.git' }
  spec.source_files     = 'WDAlertView.h,m'
  spec.requires_arc     = true
end

