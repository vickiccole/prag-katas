require "test_helper"
require_relative '../lib/anagrams.rb'

class AnagramsTest <  Minitest::Test
  def test_combinations_for_one_word
    # , "inlets", "listen", "silent"
    combinations = find_combinations("listen")
    assert_equal ["enlist"], combinations
  end
end