def find_combinations(word, master_list)
  master_list.select do |w|
    # return false if length doesnt match
    w.split("").all? do |c|
      word.include?(c)
    end
  end
end

# "pear",
# "inlets",
# "listen",
# "silent"
