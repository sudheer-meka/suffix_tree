require 'minitest/autorun'
require 'suffix_tree'

describe "SuffixTreeTest" do
  let(:words) { ["sandollar", "sandlot", "handler", "grand", "pantry"] }
  let(:tree) { SuffixTree::Base.new(words) }
  
  it 'initializes with input' do
    assert tree.words, words
  end

  it 'builds suffix tree' do
    assert tree.build
  end

  describe "find longest commom substring" do
    it 'finds longest common subtring for all the strings' do
      assert tree.longest_common_substring, "an" 
    end

    it 'finds longest common subtring for at least k substrings' do
      assert tree.longest_common_substring(2), "sand" 
      assert tree.longest_common_substring(3), "and" 
    end
  end
end
