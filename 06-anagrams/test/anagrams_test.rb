require "test_helper"
require_relative '../lib/anagrams.rb'

class AnagramsTest <  Minitest::Test
  def test_combinations_for_one_word
    master_list = [ "apple", "enlist" ]
    combinations = find_combinations("listen", master_list)
    assert_equal ["enlist"], combinations
  end

  def test_combinations_for_substrings
    master_list = ["fresher", "fresh"]
    combinations = find_combinations("refresher", master_list)
    assert_equal [], combinations
  end
end