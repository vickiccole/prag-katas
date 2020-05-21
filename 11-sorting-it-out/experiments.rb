#!/usr/bin/env ruby

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

class Rack
  attr_reader :balls

  def initialize
    @balls = []
  end

  def add(ball)
    i = 0
    while @balls[i] && @balls[i] < ball
      i += 1
    end
    @balls.insert(i, ball)
  end
end
