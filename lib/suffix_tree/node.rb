# frozen_string_literal: true

module SuffixTree
  class Node
    attr_accessor :child, :suffix_link, :start, :end, :index, :c_values, :c_value

    def initialize(start, end_p, word_count)
      @child = {}
      @suffix_link = nil
      @start = start
      @end = end_p
      @index = 0
      @depth = 0
      @c_value = 0
      @c_values = [0] * word_count
    end
  end
end
