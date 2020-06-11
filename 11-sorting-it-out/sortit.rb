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

class LetterSorter
  def initialize
    @letters = []
  end

  def letters 
    @letters.join
  end

  def add(letter)
    letter = letter.downcase
    return unless letter =~ /[a-z]/
    i = 0
    while @letters[i] && @letters[i] < letter
      i += 1
    end
    @letters.insert(i, letter)
  end
end



