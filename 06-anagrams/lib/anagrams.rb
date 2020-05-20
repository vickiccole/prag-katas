def find_combinations(word, list)
  list.select do |w|
    w.chars.all? do |c|
      char_occurences(c, w).length == char_occurences(c, word).length
    end
  end
end

def char_occurences(char, word)
  (0 .. word.length).select { |i| word[i,1] == char }
end

# "pear",
# "inlets",
# "listen",
# "silent"
