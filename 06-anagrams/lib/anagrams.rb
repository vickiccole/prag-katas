def find_combinations(word_list)
  if word_list.is_a?(Array)
    handle_array_of_words(word_list)
  elsif word_list.is_a?(String)
    handle_word_file
  else
    # throw error
  end
end

def handle_array_of_words(word_list)
  word_list.reduce([]) { |memo, w1|
    combinations = word_list.select do |w2|
      w2.chars.all? do |c|
        char_occurences(c, w2).length == char_occurences(c, w1).length
      end
    end

    combinations.length > 0 ? memo << combinations : memo
  }.uniq.reject { |x| x.length < 2 }
end

def char_occurences(char, word)
  (0 .. word.length).select { |i| word[i,1] == char }
end
