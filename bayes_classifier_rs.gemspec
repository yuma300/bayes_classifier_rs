$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bayes_classifier_rs/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bayes_classifier_rs"
  s.version     = BayesClassifierRs::VERSION
  s.authors     = ["yuma300"]
  s.email       = ["ywakimoto2s@gmail.com"]
  s.homepage    = "https://github.com/yuma300"
  s.summary     = "This suite provide you naive bayesian calassifier on rails application"
  s.description = "This suite provide you naive bayesian calassifier on rails application"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "mysql2"
end
