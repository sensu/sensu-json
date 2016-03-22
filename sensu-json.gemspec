# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "sensu-json"
  spec.version       = "1.1.0"
  spec.platform      = RUBY_PLATFORM =~ /java/ ? Gem::Platform::JAVA : Gem::Platform::RUBY
  spec.authors       = ["Sean Porter"]
  spec.email         = ["portertech@gmail.com"]
  spec.summary       = "The Sensu JSON parser abstraction library"
  spec.description   = "The Sensu JSON parser abstraction library"
  spec.homepage      = "https://github.com/sensu/sensu-json"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency("oj", "2.14.6") unless RUBY_PLATFORM =~ /java/

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "codeclimate-test-reporter"
end
