class Rack
  attr_reader :balls

  def initialize
    @balls = []
  end

  def add(ball)
    balls = @balls + [ball]
    @balls = selection_sort(balls)
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

  def selection_sort(list)
    (0..list.size - 1).each do |i|
      min_val = i

      (i + 1..list.size - 1).each do |n|
        min_val = n if list[n] < list[min_val]
      end

      list[i], list[min_val] = list[min_val], list[i]
    end

    list
  end
end
