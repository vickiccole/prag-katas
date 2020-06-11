class Rack
  attr_reader :balls

  def initialize
    @balls = []
  end

  def add(ball)
    balls = @balls + [ball]
    @balls = quicksort(balls)
  end

  private

  def quicksort(list)
    if list.size > 1
      pivot_point = list.size / 2

      val = list[pivot_point]

      left = list.select { |n| n < val }
      center = list.select { |n| n == val }
      right = list.select { |n| n > val }

      result = quicksort(left) + center + quicksort(right)
      result
    else
      list
    end
  end
end
