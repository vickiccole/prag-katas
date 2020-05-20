require 'anagram_computer.rb'
require 'key.rb'

RSpec.describe AnagramComputer do

    before (:each) do
      file = "./spec/test_wordlist.txt"
        @anagram_computer = AnagramComputer.new(file)
    end

    def word_list
        File.read("./spec/test_wordlist.txt").split
    end

    it 'creates an anagram computer class' do
      expect(@anagram_computer).to be_kind_of(AnagramComputer)
    end    

    it 'has a list of words' do
      expect(@anagram_computer.word_list).to be_kind_of(Array) 
    end

    it 'reads words from a text file' do
      expect(@anagram_computer.word_list).to eq(word_list)
    end

    it 'counts how many words are in a text file' do
      expect(@anagram_computer.word_count).to eq(5)
    end

    it 'adds every word from a file to the list of ciphers' do
      @anagram_computer.compute
      cipher_list = @anagram_computer.cipher_list
      last_cipher = cipher_list.last
      key_from_last_word = Key.new("tie")

      expect(cipher_list.length).to eq(@anagram_computer.word_count)
      expect(last_cipher).to eq(key_from_last_word.cipher)
    end

    it 'creates an array containing arrays of the indexes of all matching ciphers' do
      @anagram_computer.compute
      expected_result = [[0,2],[1,3]]

      expect(@anagram_computer.result).to eq(expected_result)
    end

    it 'creates an array of matched anagrams' do
      @anagram_computer.compute
      expected_result = [["words","sword"],["lis't","slit"]]
      
      expect(@anagram_computer.anagrams_list).to eq(expected_result)
    end

    it 'finds the length of the longest words that are anagrams' do
      @anagram_computer.compute
      longest_word_length = 5
      
      expect(@anagram_computer.length_of_longest_anagram).to eq(longest_word_length)
    end

    it 'finds the longest words that are anagrams' do
      @anagram_computer.compute
      longest_words = [["words","sword"]]

      expect(@anagram_computer.longest_anagrams).to eq(longest_words)
    end

    it 'returns the number of individual anagrams it found' do
      @anagram_computer.compute
      number_of_anagrams = 4

      expect(@anagram_computer.number_of_anagrams).to eq(number_of_anagrams)
    end

    it 'returns the number of sets of anagrams it found' do
      @anagram_computer.compute
      number_of_anagram_sets = 2

      expect(@anagram_computer.number_of_anagram_sets).to eq(number_of_anagram_sets)
    end

    it 'returns the longest sets of anagrams it found' do
      @anagram_computer.compute
      largest_anagram_sets = [["words","sword"],["lis't","slit"]]

      expect(@anagram_computer.largest_anagram_sets).to eq(largest_anagram_sets)
    end

    it 'returns the amount of anagram sets it found' do
      @anagram_computer.compute
      anagram_set_count = 2

      expect(@anagram_computer.number_of_anagram_sets).to eq(anagram_set_count)
    end

    it 'returns the amount of anagrams it found' do
      @anagram_computer.compute
      anagram_count = 4

      expect(@anagram_computer.number_of_anagrams).to eq(anagram_count)
    end
end