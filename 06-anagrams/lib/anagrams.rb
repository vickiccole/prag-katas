def find_combinations(word)
  master_list = [
    "apple",
    "enlist",
  ]

  # "pear",
  # "inlets",
  # "listen",
  # "silent"

  master_list.select do |w|
    # return false if length doesnt match
    w.split("").all? do |c|
      word.include?(c)
    end
  end
end