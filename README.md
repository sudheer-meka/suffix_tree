
# Ruby Suffix Tree
### Construct suffix tree using Ukkonen's algorithm
To create Suffix tree

    tree = SuffixTree.new(["sandollar", "sandlot", "handler", "grand", "pantry"])
    tree.build

To get the longest common substring from all the words

    tree.longest_common_substring
    => "an"

To get the longest common substring from at least 2 strings

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
Suffix Tree is released under the [MIT License](https://opensource.org/licenses/MIT).


