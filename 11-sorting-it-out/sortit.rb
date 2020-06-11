module Sortit
  module MowSort
    def list
      raise NotImplementedError.new("Must be overriden")
    end

    def insertion_position(item)
      i = 0
      while list[i] && list[i] < item
        i += 1
      end
      i
    end
  end

  class Rack
    include MowSort

    attr_reader :balls

    def initialize
      @balls = []
    end

    def list
      @balls
    end

    def add(ball)
      @balls.insert(insertion_position(ball), ball)
    end
  end

  class LetterSorter
    include MowSort

    attr_reader :list

    def initialize(selector = ->(*args) { true })
      @list = []
      @selector = selector
    end

    def letters
      @list.reduce("") { |str, this| str + (this.value * this.count) }
    end

    def add(letter)
      return unless @selector.call(letter)
      letter = Letter.new(letter.downcase)
      pos = insertion_position(letter)
      if @list[pos] == letter
        @list[pos].count += 1
      else
        @list.insert(pos, letter)
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
