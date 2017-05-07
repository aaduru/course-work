# O(n^2) - quadratic
def my_min(array)
  best_min = 0
  min = 0
  array.each_with_index do |el1, idx1|
    array.each_with_index do |el2, idx2|
      next if idx1 == idx2
      if el1 < el2
        min = el1
      end
    end
    best_min = min if min < best_min
  end
  best_min
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min(list)  # =>  -5

# O(n) - linear search
def my_min2(array)
  best_min = 0
  array.each do |el|
    best_min = el if el < best_min
  end
  best_min
end

p my_min2(list)  # =>  -5

# O(n^3 + n^2) = O(n^3)- cubic/polynomial
def largest_contiguous_subsum(array)
  best_sum = 0
  sum = 0
  subarray = []
  array.each_with_index do |el1, idx1|
    array.each_with_index do |el2, idx2|
      subarray << array[idx1..idx2]
    end
  end
  subarray.each do |arr|
    sum = arr.inject(&:+)
    best_sum = sum if sum != nil && sum > best_sum
  end
  best_sum
end

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

# O(n) linear
def largest_contiguous_subsum2(array)
  best_sum = array.first
  current_sum = array.first
  array.drop(1).each do |el|
    if current_sum < 0
      current_sum = 0
    end
    current_sum += el
    best_sum = current_sum if current_sum > best_sum
  end
  best_sum
end

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum2(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum2(list) # => -1 (from [-1])
