lib = File.expand_path("lib", __dir__)
$:.unshift lib unless $:.include?(lib)

require "io_streams/version"

Gem::Specification.new do |s|
  s.name        = 'suffix_tree'
  s.version     = '0.0.0'
  s.platform              = Gem::Platform::RUBY
  s.summary     = "Suffix Tree Implementaion and operation using ruby"
  s.description = "We can find longest common substring of two are more strings using Suffix Tree"
  s.authors     = ["Sudheer Meka"]
  s.email       = 'reachme@sudheer-meka.com'
  s.files       = Dir["lib/**/*", "Rakefile"]
  s.test_files            = Dir["test/**/*"]
  s.homepage    =
    'https://rubygems.org/gems/suffix_tree'
  s.license       = 'MIT'
end
