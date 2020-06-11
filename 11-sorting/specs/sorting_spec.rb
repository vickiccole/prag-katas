require('minitest/autorun')
require('minitest/rg')
require_relative('../sorting.rb')

class SortingTest < MiniTest::Test

  def setup()
    @numbers = [12, 3, 44, 7]
    @words = 'Try this one.'
  end

  def test_can_sort_numbers__empty_array
    assert_equal([],sort([]))
  end

  def test_can_sort_numbers
    sorted_numbers = sort(@numbers)
    assert_equal([3, 7, 12, 44], sorted_numbers)
  end

  def test_can_add_number_and_stay_sorted
    new_numbers = add(@numbers, 15)
    assert_equal([3, 7, 12, 15, 44], new_numbers)
  end

  def test_can_sort_letters
    sorted_letters = sort_letters(@words)
    assert_equal('ehinorstty', sorted_letters)
  end

end
