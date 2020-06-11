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