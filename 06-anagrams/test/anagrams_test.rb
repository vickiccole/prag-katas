require "test_helper"
require_relative '../lib/anagrams.rb'

class AnagramsTest <  Minitest::Test
  def test_combinations_for_one_word
    master_list = [ "apple", "enlist", "listen" ]
    combinations = find_combinations(["listen"], master_list)
    assert_equal [["enlist", "listen"]], combinations
  end

  def test_combinations_for_substrings
    master_list = ["fresher", "fresh"]
    combinations = find_combinations(["refresher"], master_list)
    assert_equal [], combinations
  end

  def test_combinations_for_multiple_words
    master_list = [
      "crepitus", "cuprites", "pictures", "piecrust",
      "enlist", "inlets", "listen", "silent",
      "labrador", "wallet", "cruciferus"
    ]

    combinations = find_combinations(["pictures", "enlist"], master_list)
    assert_equal [
      [ "crepitus", "cuprites", "pictures", "piecrust" ],
      ["enlist", "inlets", "listen", "silent" ]
    ], combinations
  end

  def test_passing_in_master_list_from_file
    
  end
end