# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ssedap-client/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Sean Barkley", "Cody Krieger"]
  gem.email         = ["sean@seanbarkley.com", "cody@codykrieger.com"]
  gem.description   = %q{A gem for authenticating and interfacing with an SSEDAP interface.}
  gem.summary       = %q{A gem for authenticating and interfacing with an SSEDAP interface.}
  gem.homepage      = "http://sse.se.rit.edu"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "ssedap-client"
  gem.require_paths = ["lib"]
  gem.version       = Ssedap::Client::VERSION
end
