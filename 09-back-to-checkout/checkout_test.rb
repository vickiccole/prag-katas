require 'checkout'
require 'minitest/autorun'
require 'minitest/color'

class CheckOutTest < Minitest::Test
  

  RULES = {
    "A" => Rule.costs(10),
    "B" => Rule.special_buy(unit_price: 40, buy: 5, pay: 75),
    "C" => Rule.costs(30),
    "D" => Rule.special_buy(unit_price: 40, buy: 3, pay: 100),
  }

  def price(items)
    co = CheckOut.new(RULES)
    items.split('').each { |item| co.scan(item) }
    co.total
  end

  def test_totals
    assert_equal(40, price('D'))    
    assert_equal(80, price('DD'))    
    assert_equal(100, price('DDD'))    
    assert_equal(140, price('DDDD'))    
    
    assert_equal(90, price('AAABBB'))    
    assert_equal(105, price('AAABBBBB'))    
  end

  def test_incremental
    co = CheckOut.new(RULES)
    co.scan("A"); assert_equal(10, co.total)
    co.scan("B"); assert_equal(30, co.total)
    co.scan("C"); assert_equal(60, co.total)
    co.scan("D"); assert_equal(100, co.total)
  end
end