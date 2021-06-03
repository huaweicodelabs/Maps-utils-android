Pod::Spec.new do |s|
  s.name = 'HuaweiSite'
  s.version = '1.0.0'
  s.license = 'Apache 2.0'
  s.summary = 'HuaweiSite Kit in Swift'
  s.homepage = 'https://github.com/.../...'
  s.authors = { '...' => '...' }
  s.source = { :git => 'https://github.com/...', :tag => s.version }
  s.documentation_url = 'https://huawei.../'

  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '9.0'

  s.swift_versions = ['5.1', '5.2', '5.3']

  s.source_files = 'Source/*.swift'

end
