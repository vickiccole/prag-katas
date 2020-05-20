class Key
    attr_reader :cipher

    def initialize(input)
        @cipher = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
        create_cipher(input)
    end

    private

    def create_cipher(input)
        input.gsub(/\W+/, '').chars do |ch|
            position_in_alphabet = ch.upcase.ord - 65
            @cipher[position_in_alphabet] += 1
        end
    end
end