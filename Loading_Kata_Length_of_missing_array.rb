def validate_each_array_element(array)
  flag = 0 # if none of the array elements is nil or empty
  array.each do |array|
    return flag = 1 if (array == nil || array.empty?)
  end
  flag == 1 # if one of the array elements is nil or empty
end

def array_sort(array)
  aux_array = []
  array.sort_by(&:length).each {|x| aux_array << x.length}
  last_length = aux_array[0]-1
  aux_array.each do |lengths|
    return (last_length + 1) if lengths - last_length != 1
    last_length = lengths
  end
end

def getLengthOfMissingArray(array_of_arrays)
  if array_of_arrays == nil || array_of_arrays.empty? || validate_each_array_element(array_of_arrays)
    0
  else
    array_sort(array_of_arrays)
  end
end
