# frozen_string_literal: true

module SuffixTree
  # Active point - It is the point from which traversal starts for next extension or next phase.
  # Active point always starts from root. Other extension will get active point set up
  # correctly by last extension.

  # Active node - Node from which active point will start
  # Active Edge - It is used to choose the edge from active node. It has index of character.
  # Active Length - How far to go on active edge.

  # Active point rules
  # 1) If rule 3 extension is applied then active length will increment by 1 if active length is
  #    not greater then length of path on edge.
  # 2) If rule 3 extension is applied and if active length gets greater than length path of edge
  #    then change active node, active edge and active length
  # 3) If active length is 0 then always start looking for the character from root.
  # 4) If rule 2 extension is applied and if active node is root then active edge is active edge + 1
  #    and active length is active lenght -1
  # 5) If rule 2 extension is applied and if active node is not root then follow suffix link and
  #    make active node as suffix link and do no change anything.
  class ActivePoint
    attr_accessor :length, :edge, :node

    def initialize(node)
      @length = 0
      @edge = -1
      @node = node
    end
  end
end
