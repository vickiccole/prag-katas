def find_combinations(word_list)
  result = word_list.reduce([]) do |memo, w1|
    combinations = word_list.select do |w2|
      w2.chars.all? do |c|
        char_occurences(c, w2).length == char_occurences(c, w1).length
      end
    end

    combinations.length > 0 ? memo << combinations : memo
  end

  result.uniq.reject {|x| x.length <= 1}
end

private 

def char_occurences(char, word)
  (0 .. word.length).select { |i| word[i,1] == char }
end
