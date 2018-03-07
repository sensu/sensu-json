# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "sensu-json"
  spec.version       = "2.1.0"
  spec.platform      = RUBY_PLATFORM =~ /java/ ? Gem::Platform::JAVA : Gem::Platform::RUBY
  spec.authors       = ["Sean Porter"]
  spec.email         = ["portertech@gmail.com", "engineering@sensu.io"]
  spec.summary       = "The Sensu JSON parser abstraction library"
  spec.description   = "The Sensu JSON parser abstraction library"
  spec.homepage      = "https://github.com/sensu/sensu-json"
  spec.license       = "MIT"

  spec.files         = Dir.glob("lib/**/*") + %w[sensu-json.gemspec README.md LICENSE.txt]
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  if RUBY_PLATFORM =~ /java/
    spec.add_dependency("jrjackson", "0.4.0")
  else
    spec.add_dependency("oj", "2.18.1")
  end

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.cert_chain    = ["certs/sensu.pem"]
  spec.signing_key   = File.expand_path("~/.ssh/gem-sensu-private_key.pem") if $0 =~ /gem\z/
end
