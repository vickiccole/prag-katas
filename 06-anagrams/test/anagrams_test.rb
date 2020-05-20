require "test_helper"
require_relative '../lib/anagrams.rb'

class AnagramsTest <  Minitest::Test
  def test_excluding_words_with_no_anagrams
    word_list = [ "pear", "apple", "enlist", "listen" ]
    combinations = find_combinations(word_list)
    assert_equal [["enlist", "listen"]], combinations
  end

  def test_no_combinations_for_substring_case
    word_list = ["fresher", "fresh"]
    combinations = find_combinations(word_list)
    assert_equal [], combinations
  end

  def test_running_master_list_on_itself
    master_list = [
      "crepitus", "cuprites", "pictures", "piecrust",
      "enlist", "inlets", "listen", "silent",
      "labrador", "wallet", "cruciferus"
    ] 

    expected = [
      ["crepitus", "cuprites", "pictures", "piecrust"],
      ["enlist", "inlets", "listen", "silent"]
    ] 

    assert_equal expected, find_combinations(master_list)
  end

  # def test_passing_in_word_list_from_file

  #   word_list = "./data/master_list.txt"
  #   find_combinations()
  # end
end