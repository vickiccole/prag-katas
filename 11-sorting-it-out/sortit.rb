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

class LowercaseAlpha 
  attr_accessor :count
  attr_reader :value

  def initialize(value)
    @count = 1
    @value = value.downcase
    raise ArgumentError.new("'#{@letter}'' is not alphanumeric") unless @value =~ /[a-z]/
  end

  def ==(other)
    @value == other.value
  end

  def <(other)
    @value < other.value
  end
end

class LetterSorter
  def initialize
    @letters = []
  end

  def letters 
    @letters.reduce("") { |str, this| str + (this.value * this.count) }
  end
  
  def add(letter)
    begin
      letter = LowercaseAlpha.new(letter)
    rescue ArgumentError
      return 
    end
    
    i = 0
    while @letters[i] && @letters[i] < letter
      i += 1
    end

    if @letters[i] == letter
      @letters[i].count += 1
    else 
      @letters.insert(i, letter)
    end
  end
end



