def find_combinations(source)
  if source.is_a?(Array)
    find_combinations_from_array(source)
  elsif source.is_a?(String)
    find_combinations_from_file(source)
  else
    # throw error
  end
end

def find_combinations_from_array(word_list)
  word_list.reduce([]) { |memo, w1|
    combinations = word_list.select do |w2|
      w2.chars.all? do |c|
        char_occurences(c, w2).length == char_occurences(c, w1).length
      end
    end

    combinations.length > 0 ? memo << combinations : memo
  }.uniq.reject { |x| x.length < 2 }
end

def find_combinations_from_file(filename)
  word_list = IO.readlines(filename, chomp: true)
  find_combinations_from_array(word_list)
end

def char_occurences(char, word)
  (0 .. word.length).select { |i| word[i,1] == char }
end
