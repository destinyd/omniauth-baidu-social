# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-baidu/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = "DestinyD"
  gem.email         = "destinyd.war@gmail.com"
  gem.description   = %q{OmniAuth Oauth2 strategy for baidu.com.}
  gem.summary       = %q{OmniAuth Oauth2 strategy for baidu.com.}
  gem.homepage      = "https://github.com/destinyd/omniauth-baidu-social"
  
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-baidu"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::Baidu::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0'
end
