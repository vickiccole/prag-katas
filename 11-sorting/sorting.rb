def sort(arr)
  rec_sort(arr, [])
end

def rec_sort(unsorted, sorted)
  if unsorted.size <= 0
    return sorted
  end
  smallest = unsorted.pop
  still_unsorted = []

  unsorted.each do |x|
    if x < smallest
      still_unsorted.push(smallest)
      smallest = x
    else
      still_unsorted.push(x)
    end
  end

  sorted.push(smallest)

  rec_sort(still_unsorted, sorted)

end

def add(num_arr, new_one)
  new_arr = num_arr.push(new_one)
  sort(new_arr)
end

def sort_letters(words)
  tidied_word = words.gsub(/[[:punct:]]/, '').delete(" ").downcase.split("")
  sorted_letters = sort(tidied_word)
  return sorted_letters.join("")
end
