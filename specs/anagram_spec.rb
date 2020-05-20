require('minitest/autorun')
require('minitest/rg')
require_relative('../anagram.rb')

class AnagramTest < MiniTest::Test

  def setup()
    @words = ['dog', 'rat', 'cat', 'act', 'fish', 'chicken']
    @searchWord = 'tar'
  end

  def test_can_get_searchWord_length
    assert_equal(3, searchWordLength(@searchWord))
  end

  def test_find_words_of_right_length
    wordsOfRightLength = find_words_of_right_length(@searchWord, @words)
    assert_equal(['dog', 'rat', 'cat', 'act'], wordsOfRightLength)
  end

  def test_find_words_of_right_length__no_matches
    wordsOfRightLength = find_words_of_right_length("sheep", @words)
    assert_equal([], wordsOfRightLength)
  end

  def test_find_matching_letters
    wordsOfRightLength = find_words_of_right_length(@searchWord, @words)
    letter = 1
    assert_equal(['rat'], matching_letters(@searchWord, letter, wordsOfRightLength))
  end

  def test_find_anagrams
    assert_equal(['rat'], find_anagrams(@searchWord, @words))
  end

  def test_find_anagrams__no_matches
    assert_equal([], find_anagrams("sheep", @words))
  end

end
