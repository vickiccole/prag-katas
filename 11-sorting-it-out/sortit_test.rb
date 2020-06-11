require 'sortit'
require 'minitest/autorun'
require 'minitest/color'


class SortitTest < Minitest::Test
  include Sortit

  def generator(max = 59)
    balls = (0..max).to_a
    n = balls.count - 1
    Enumerator.new do |yld|
      while n > 0
        yld << balls.delete_at(rand(n))
        n -= 1
      end
    end
  end

  def test_sorting_balls
     daisy_may = generator(59)
     rack = Rack.new 
     rand(0..59).times { rack.add(daisy_may.next) }
     assert_equal rack.balls.sort, rack.balls
  end

  def test_sorting_characters
    sentence = "When not studying nuclear physics, Bambi likes to play
beach volleyball."
    sorter = LetterSorter.new(-> (letter) { letter =~ /[a-zA-Z]/ })
    sentence.chars.each { |letter| sorter.add(letter) }
    expected = "aaaaabbbbcccdeeeeeghhhiiiiklllllllmnnnnooopprsssstttuuvwyyyy"
    assert_equal expected, sorter.letters
  end
end