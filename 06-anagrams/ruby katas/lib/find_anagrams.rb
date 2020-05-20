require_relative 'anagram_computer'

class FindAnagrams

    def initialize
        @anagram_computer = AnagramComputer.new("../test_wordlist.txt")
        @anagram_computer.compute
    end

    def introduction
        puts "\nHello, I am the anagram computer."
    end

    def print_formatted_anagrams
        puts "\nI found #{@anagram_computer.number_of_anagrams} anagrams for you, in #{@anagram_computer.number_of_anagram_sets} sets:"
        @anagram_computer.anagrams_list.each do |line|
            puts line.join(", ")
        end
    end

    def print_longest_anagram
        puts "\nThe longest anagrams I could find have #{@anagram_computer.length_of_longest_anagram} letters. They are:"
        @anagram_computer.longest_anagrams.each do |line|
            puts line.join(", ")
        end
    end

    def print_largest_anagram_sets
        puts "\nThe largest anagram sets I could find each have #{@anagram_computer.largest_anagram_set_length} anagrams. They are:"
        @anagram_computer.largest_anagram_sets.each do |line|
            puts line.join(", ")
        end
    end


    find_anagrams = FindAnagrams.new
    find_anagrams.introduction
    find_anagrams.print_formatted_anagrams
    find_anagrams.print_longest_anagram
    find_anagrams.print_largest_anagram_sets
    puts ""

end