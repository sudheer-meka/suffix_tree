# frozen_string_literal: true

require 'suffix_tree/version'

module SuffixTree
  autoload :Node, 'suffix_tree/node'
  autoload :ActivePoint, 'suffix_tree/active_point'
  autoload :End, 'suffix_tree/end'
end
require 'suffix_tree/base'
