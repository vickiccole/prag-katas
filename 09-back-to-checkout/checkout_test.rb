require 'checkout'
require 'minitest/autorun'
require 'minitest/color'

class CheckOutTest < Minitest::Test
  RULES = {
    "A" => -> (num_items) { num_items * 10 },
    "B" => -> (num_items) { num_items * 20 },
    "C" => -> (num_items) { num_items * 30 },
    "D" => -> (num_items) { (num_items / 3 * 100) + (num_items % 3 * 40) },
  }

  def test_n_for_n
    co = CheckOut.new(RULES)
    co.scan("D"); assert_equal 40, co.total
    co.scan("D"); assert_equal 80, co.total
    co.scan("D"); assert_equal 100, co.total
    co.scan("D"); assert_equal 140, co.total
  end 

  def test_incremental
    co = CheckOut.new(RULES)
    co.scan("A"); assert_equal(10, co.total)
    co.scan("B"); assert_equal(30, co.total)
    co.scan("C"); assert_equal(60, co.total)
    co.scan("D"); assert_equal(100, co.total)
  end
end