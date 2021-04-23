lib = File.expand_path("lib", __dir__)
$:.unshift lib unless $:.include?(lib)

require "suffix_tree/version"

Gem::Specification.new do |s|
  s.name        = 'suffix_tree_ruby'
  s.version     = SuffixTree::VERSION
  s.platform              = Gem::Platform::RUBY
  s.summary     = "Suffix Tree Implementaion and operation using ruby"
  s.description = "Construct Generalized Suffix tree using Ukkonen's algorithm"
  s.authors     = ["Sudheer Meka"]
  s.email       = 'reachme@sudheer-meka.com'
  s.files       = Dir["lib/**/*", "Rakefile"]
  s.test_files            = Dir["test/**/*"]
  s.homepage    =
    'https://rubygems.org/gems/suffix_tree'
  s.license       = 'MIT'
  s.metadata    = { "source_code_uri" => "https://github.com/sudheer-meka/suffix_tree" }
end
