#O(n^2) quadratic
def bad_two_sum?(array,target_sum)
  array.each_with_index do |el1,idx1|
    array[idx1+1..-1].each do |el2|
      return true if el1 + el2 == target_sum
    end
  end
  false
end

arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false

# O(n log n + n) == O(n log n) linearithmic, sort
def okay_two_sum?(array,target_sum)
  array_sorted = array.sort
  i = 0
  j = array.length - 1

  until i == j
    sum = array_sorted[i] + array_sorted[j]
    return true if sum == target_sum
    if sum < target_sum
      i += 1
    elsif sum > target_sum
      j -= 1
    end
  end
  false
end

arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false

arr = [3, 4, 7, 10, 2, 9]
p okay_two_sum?(arr, 17) # => should be true
p okay_two_sum?(arr, 20) # => should be false

# O(n + n + 1) == O(n) linear
def two_sum?(array, target_sum)
  array_hash = {}
  array.each do |el|
    array_hash[el] = true
  end

  array.each_with_index do |el|
    next if target_sum - el == el
    return true if array_hash[target_sum - el]
  end
  false
end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false

arr = [3, 4, 7, 10, 2, 9]
p two_sum?(arr, 17) # => should be true
p two_sum?(arr, 20) # => should be false
