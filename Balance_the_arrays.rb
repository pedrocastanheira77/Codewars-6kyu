def uniq_identifier(arr)
  arr_uniq_values = arr.uniq
  uniq_values_counter = []
  for i in 0...arr_uniq_values.size
    uniq_values_counter << arr.count(arr_uniq_values[i])
  end
  uniq_values_counter.sort!
end

def balance(arr1, arr2)
  uniq_identifier(arr1) == uniq_identifier(arr2)
end
