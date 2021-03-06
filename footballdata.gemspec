# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.name          = 'footballdata'
  gem.version       = '0.4'
  gem.date          = Date.today
  gem.authors       = ["Joshua Jansen"]
  gem.email         = ["joshuajansen88@gmail.com"]
  gem.description   = %q{Wrapper for the football-data.org API}
  gem.summary       = %q{This gem leverages the football-data.org API to get football data like teams and results.}
  gem.homepage      = "https://github.com/joshuajansen/footballdata"

  gem.files         = `git ls-files`.split($\)
  gem.license       = 'MIT'

  gem.add_runtime_dependency "sanitize", "~> 4.0"
  gem.add_development_dependency "dotenv", "~> 2.1"
end
