module Sortit

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
    def initialize(selector = -> (*args) {true} )
      @letters = []
      @selector = selector
    end

    def letters 
      @letters.reduce("") { |str, this| str + (this.value * this.count) }
    end
    
    def add(letter)
      return unless @selector.call(letter)
      letter = Letter.new(letter.downcase)
      
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

    class Letter 
      attr_accessor :count
      attr_reader :value
  
      def initialize(value)
        @count = 1
        @value = value
      end
  
      def ==(other)
        @value == other.value
      end
  
      def <(other)
        @value < other.value
      end
    end  
  end
end


