def find_combinations(query_list, master_list)
  query_list.reduce([]) do |memo, query_word|
    matches = master_list.select do |master_word|
      master_word.chars.all? do |c|
        char_occurences(c, master_word).length == char_occurences(c, query_word).length
      end
    end

    matches.length > 0 ? memo << matches : memo
  end
end

private 

def char_occurences(char, word)
  (0 .. word.length).select { |i| word[i,1] == char }
end
