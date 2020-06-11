require "test_helper"
require_relative '../lib/11_rack.rb'

class RackTest <  Minitest::Test
  def test_foo
    rack = Rack.new
    assert_equal [], rack.balls

    rack.add(20)
    assert_equal [ 20 ], rack.balls

    rack.add(10)
    assert_equal [ 10, 20 ], rack.balls

    rack.add(30)
    assert_equal [ 10, 20, 30 ], rack.balls
  end
end