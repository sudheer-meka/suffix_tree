# frozen_string_literal: true

module SuffixTree
  # https://en.wikipedia.org/wiki/Ukkonen%27s_algorithm
  class Base
    attr_accessor :input, :root, :remaining, :end, :active, :words, :uniq_word_map, :l_map

    UNIQ_IDENTIFIERS = ((0...97).map(&:chr) + (135...200).map(&:chr)).freeze

    def initialize(words)
      @words = words
      @input = ''
      @l_map = {}
      @uniq_word_map = {}
      words.each_with_index do |word, index|
        id = UNIQ_IDENTIFIERS[index]
        @uniq_word_map[id] = index
        @input += "#{word}#{id}"
      end
      @input = @input.split('')
      @remaining = 0
    end

    def build
      self.root = Node.new(1, End.new(0), words.count)
      root.index = -1
      self.active = ActivePoint.new(root)
      self.end = End.new(-1)
      input.each_with_index do |_elm, index|
        start_phase(index)
      end

      set_index_dfs(root, 0, input.length)
      set_lvalues_dfs(root)
    end

    def set_lvalues_dfs(node, str = '')
      return unless node

      return if node.index != -1

      str += input[node.start..node.end.end].join('')
      if l_map[node.c_value]
        if l_map[node.c_value].length < str.length
          l_map[node.c_value] = str
        elsif l_map[node.c_value].length == str.length
          l_map[node.c_value] = [str, l_map[node.c_value]].min
        end
      else
        l_map[node.c_value] = str
      end

      node.child.each do |_key, child|
        set_lvalues_dfs(child, str)
      end
    end

    def set_index_dfs(node, val, size)
      return unless node

      val += node.end.end - node.start + 1
      if node.index != -1
        node.index = size - val
        c_index = node.index

        c_index += 1 until uniq_word_map[input[c_index]]
        node.c_values[uniq_word_map[input[c_index]]] = 1
        return
      end
      nums = [node.c_values]
      node.child.each do |_key, child|
        set_index_dfs(child, val, size)
        nums << child.c_values
      end
      if node != root
        node.c_values = nums.transpose.map(&:sum).map { |e| e.positive? ? 1 : 0 }
      end
      node.c_value = node.c_values.sum
    end

    def start_phase(index)
      last_created_internal_node = nil
      self.end.end += 1
      self.remaining += 1

      while remaining.positive?
        if active.length.zero?
          if select_node(index)
            active.edge = select_node(index).start
            active.length += 1
            break
          else
            root.child[input[index]] = Node.new(index, self.end, words.count)
            self.remaining -= 1
          end
        else
          begin
            char = next_char(index)
            if char == input[index]
              last_created_internal_node.suffix_link = selected_node if last_created_internal_node
              walk_down(index)
              break
            else
              node = selected_node
              temp_start = node.start
              node.start = node.start + active.length
              new_internal_node = Node.new(temp_start, End.new(temp_start + active.length - 1), words.count)

              new_leaf_node = Node.new(index, self.end, words.count)

              new_internal_node.child[input[new_internal_node.start + active.length]] = node
              new_internal_node.child[input[index]] = new_leaf_node
              new_internal_node.index = -1
              active.node.child[input[new_internal_node.start]] = new_internal_node

              last_created_internal_node.suffix_link = new_internal_node if last_created_internal_node

              last_created_internal_node = new_internal_node
              new_internal_node.suffix_link = root

              if active.node != root
                active.node = active.node.suffix_link
              else
                active.edge = active.edge + 1
                active.length -= 1
              end
              self.remaining -= 1
            end
          rescue StandardError
            node = selected_node
            node.child[input[index]] = Node.new(index, self.end, words.count)
            last_created_internal_node.suffix_link = node if last_created_internal_node
            last_created_internal_node = node

            if active.node != root
              active.node = active.node.suffix_link
            else
              active.edge = active.edge + 1
              active.length -= 1
            end
            self.remaining -= 1
          end
        end
      end
    end

    def walk_down(index)
      node = selected_node

      if diff(node) < active.length
        active.node = node
        active.length = active.length - diff(node)
        active.edge = node.child[input[index]].start
      else
        active.length += 1
      end
    end

    def next_char(i)
      node = selected_node
      return input[active.node.child[input[active.edge]].start + active.length] if diff(node) >= active.length

      if diff(node) + 1 == active.length
        return input[i] if node.child[input[i]]
      else
        active.node = node
        active.length = active.length - diff(node) - 1
        active.edge = active.edge + diff(node) + 1
        return next_char(i)
      end
      raise 'End Of Path Reached'
    end

    def diff(node)
      node.end.end - node.start
    end

    def selected_node
      active.node.child[input[active.edge]]
    end

    def select_node(index)
      active.node.child[input[index]]
    end

    def longest_common_substring(k = words.length)
      raise 'Input has to be integer' unless k.is_a? Integer
      raise 'Invalid Input' if k <= 0

      return base_case if k == 1

      max_length = -1
      answer = ''

      l_map.each do |key, v|
        next if key < k

        if v.length > max_length
          max_length = v.length
          answer = v
        elsif v.length == max_length
          answer = [v, answer].min
        end
      end
      answer
    end

    def base_case
      max_length = -1
      answer = ''

      words.each do |word|
        if max_length < word.length
          max_length = word.length
          answer = word
        elsif max_length == word.length
          answer = [answer, word].min
        end
      end
      answer
    end
  end
end
