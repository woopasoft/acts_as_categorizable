# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'acts-as-categorizable/version'

Gem::Specification.new do |spec|
  spec.name          = 'acts-as-categorizable'
  spec.version       = ActsAsCategorizable::VERSION
  spec.authors       = ['Federico Moretti']
  spec.email         = ['federico.moretti@woopasoft.com']

  spec.summary       = %q(Makes a model categorizable)
  spec.description   = %q(Allows any model to be categorized.)
  spec.homepage      = 'https://github.com/woopasoft/acts_as_categorizable'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
    .reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'friendly_id', '~> 5.1.0', '>= 5.1.0'
  spec.add_dependency 'ancestry', '~> 2.1.0', '>= 2.1.0'

  spec.add_development_dependency 'bundler', '~> 1.10', '>= 1.10'
  spec.add_development_dependency 'rake', '~> 10.0', '>= 10.0'
  spec.add_development_dependency 'rspec', '~> 3.4.0', '>= 3.4.0'
  spec.add_development_dependency 'railties', '~> 4.2.5', '>= 4.2.5'
  spec.add_development_dependency 'sqlite3', '~> 1.3.11', '>= 1.3.11'
  spec.add_development_dependency 'database_cleaner', '~> 1.5.1', '>= 1.5.1'
end
