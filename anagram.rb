def searchWordLength(word)
  return word.length
end

def find_words_of_right_length (word, words)
  filteredWords = []
  searchWordLength = searchWordLength(word)
  words.each { |x|
    if x.length === searchWordLength
      filteredWords << x
    end
  }
  return filteredWords
end

def matching_letters(word, letter, filteredWords)
  matchedWords = []
  searchWordLength = searchWordLength(word)

  if letter <= searchWordLength
    filteredWords.each { |x|
      if x.include?(word[letter-1])
        matchedWords << x
      end
    }
    letter += 1
    matching_letters(word, letter, matchedWords)
  else
    return filteredWords
  end

end

def find_anagrams(word, words)
  searchWordLength = searchWordLength(word)

  filteredWords = find_words_of_right_length(word, words)

  possibleAnagrams = matching_letters(word, 1, filteredWords)

  sortedWord = word.split("").sort
  anagrams = []

  possibleAnagrams.each { |x|
    if x.split("").sort === sortedWord
      anagrams << x
    end
  }

  return anagrams

end


words = File.readlines('./wordlist.txt', chomp: true)
print "Enter word: "
word = gets.chomp
anagrams = find_anagrams(word, words)
puts "Anagrams of #{word} are - ", anagrams
