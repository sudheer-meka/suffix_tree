
  

# Generalised Suffix Tree - Ruby

  
### Set up

    gem install suffix_tree_ruby
or

    gem 'suffix_tree_ruby', '~> 0.0.1'

Open a ruby interactive console:

        require 'suffix_tree'


### Construct suffix tree using Ukkonen's algorithm

To create Suffix tree

  

tree = SuffixTree::Base.new(["sandollar", "sandlot", "handler", "grand", "pantry"])

tree.build

  

To get the longest common substring from all the words

  

tree.longest_common_substring

=> "an"

  

To get the longest common substring from at least k strings

  

tree.longest_common_substring(2)

=> "sand" # from the first 2 strings

tree.longest_common_substring(3)

=> "and" # from first 3 strings

  

## Referrances

[https://en.wikipedia.org/wiki/Ukkonen%27s_algorithm](https://en.wikipedia.org/wiki/Ukkonen%27s_algorithm)

[https://en.wikipedia.org/wiki/Longest_common_substring_problem](https://en.wikipedia.org/wiki/Longest_common_substring_problem)

[http://web.stanford.edu/~mjkay/gusfield.pdf](http://web.stanford.edu/~mjkay/gusfield.pdf)

[https://web.cs.ucdavis.edu/~gusfield/cs224f09/commonsubstrings.pdf](https://web.cs.ucdavis.edu/~gusfield/cs224f09/commonsubstrings.pdf)

  

## Author

[Sudheer Meka](https://github.com/sudheer-meka)

  

## License

Suffix Tree Ruby is released under the [MIT License](https://opensource.org/licenses/MIT).
