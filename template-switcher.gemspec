# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'template_switcher/version'

Gem::Specification.new do |gem|
  gem.name          = "template-switcher"
  gem.version       = TemplateSwitcher::VERSION
  gem.authors       = ["joker1007"]
  gem.email         = ["kakyoin.hierophant@gmail.com"]
  gem.description   = %q{Switch template of rails by view_path mapping}
  gem.summary       = %q{Switch template of rails by view_path mapping}
  gem.homepage      = "https://github.com/joker1007/template-switcher"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'activesupport', ['>= 3.0.0']
  gem.add_dependency 'actionpack', ['>= 3.0.0']
  gem.add_dependency 'railties', ['>= 3.1']

  gem.add_development_dependency 'bundler', ['>= 1.0.0']
  gem.add_development_dependency 'rake', ['>= 0']
  gem.add_development_dependency 'rspec', ['>= 0']
  gem.add_development_dependency 'rspec-rails', ['>= 0']
  gem.add_development_dependency 'rails', ['~> 4.1.1']
end
