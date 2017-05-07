# # # Recursive
# # def range(start_value, end_value)
# #   sum = 0
# #   return [] if end_value < start_value
# #   return start_value  if start_value == end_value
# #   start_value + range(start_value + 1, end_value)
# # end
# #
# # # Iterative
# # def range_it(start_value, end_value)
# #   sum = 0
# #   (start_value..end_value).to_a.inject(&:+)
# # end
# #
# # #exponent 1
# # def exp(base, exponent)
# #   return 1 if exponent == 0
# #   base * exp(base , exponent - 1)
# # end
# # #exponent 1
# # def exp2(base, exponent)
# #   return 1 if exponent == 0
# #   return base if exponent == 1
# #   if exponent.even?
# #     exp2(base , exponent/2) ** 2
# #   else
# #     base  * (exp2(base, (exponent - 1) / 2) ** 2)
# #   end
# # end
# #
# # p exp(0,0) == 1
# # p exp(0,1) == 0
# # p exp(1,0) == 1
# # p exp(1,1) == 1
# # p exp(1,2) == 1
# # p exp(2,0) == 1
# # p exp(2,1) == 2
# # p exp(2,2) == 4
# #
# # p exp2(0,0) == 1
# # p exp2(0,1) == 0
# # p exp2(1,0) == 1
# # p exp2(1,1) == 1
# # p exp2(1,2) == 1
# # p exp2(2,0) == 1
# # p exp2(2,1) == 2
# # p exp2(2,2) == 4
# #
# # class Array
# #   def deep_dup
# #     if self.none?{|el| el.is_a?(Array)}
# #       new_array = []
# #       self.each do |el|
# #         new_array << el
# #       end
# #       return new_array
# #     end
# #       #inductive step
# #     self.map {|el| el.deep_dup}
# #   end
# # end
# #
# # fib_sample = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
# #
# # #recursion
# # def fibonacci(n, array = nil)
# #   return array if array != nil && array.length == n
# #   return [1] if n == 1
# #   if array.nil?
# #     fibonacci(n, [1,1])
# #   else
# #     next_array = array
# #     next_array = next_array << array[-2..-1].inject(&:+)
# #     fibonacci(n, next_array)
# #   end
# # end
# #
# # fibonacci(10)
# #
# # #iteration
# # def fibonacci_it(n)
# #   new_array = [1]
# #   (n - 1).times do |el|
# #     if new_array[-2].nil?
# #       new_array << new_array[-1]
# #     else
# #       new_array << new_array[-1] + new_array[-2]
# #     end
# #   end
# #   new_array
# # end
# #
# def permutation(array)
#   new_array = []
#   return array if array.size < 2
#   el = array[0]
#   permutation(array[1..-1]).each do |next_step|
#     #p el
#     (0...next_step).each {new_array << [el,next_step]}
#     new_array
#   end
# #new_array
# end

# def permutation(array)
#   return array if array.length < 2
#   result = []
#   array.each_with_index do |el, idx|
#     rest = array.take(idx) + array.drop(idx + 1)
#     perm = permutation(rest)
#     perm.each do |nex|
#       result << nex + el
#     end
#   end
#   result
# end
#
# p permutation([1, 2, 3])
# #
# # require 'byebug'
# # def bsearch(array, value)
# #   return nil if array.length == 1 && array[0] != value
# #
# #   middle_index = array.length / 2
# #   left_array = array[0...middle_index]
# #   right_array = array[middle_index..-1]
# #
# #   return middle_index if array[middle_index] == value
# #
# #   if array[middle_index] < value
# #     b_search_right = bsearch(right_array, value)
# #     return nil if b_search_right.nil?
# #     return middle_index + b_search_right
# #   else
# #     return bsearch(left_array, value)
# #   end
# # end
# #
# # p bsearch([1, 2, 3], 1) # => 0
# # p bsearch([2, 3, 4, 5], 3) # => 1
# # p bsearch([2, 4, 6, 8, 10], 6) # => 2
# # p bsearch([1, 3, 4, 5, 9], 5) # => 3
# # p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# # p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# # p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
#
# def merge_sort(array)
#   return  array if array.length <= 1
#
#    mid_idx = array.length / 2
#   # merge_sort(array[0...mid_idx]) + merge_sort(array[mid_idx..-1])
#   left_array = merge_sort(array[0...mid_idx])
#   right_array = merge_sort(array[mid_idx..-1])
#   p left_array
#   puts "  "
#   p right_array
#   # merge_sort(left_array)
#   # merge_sort(right_array)
#   return merge(left_array,right_array)
#
# end
#
# def merge(left , right)
#   result = []
#   until left.empty? && right.empty?
#     if right.empty? || left.first <= right.first
#       result << left.shift
#     else
#       result << right.shift
#     end
#   end
#   return result
# end
#
# a = [9,8,7,6,5]
# p merge_sort(a)
# #a = [[9],[8],[7],[6],[5]]
# #[5,6,7,8,9]


# def subsets(array)
#   # return [] if array.empty?
#   # array.first + subsets(array[1..-1])
#   return [[]] if array.empty?
#   arr = []
#   #arr << array.first
#   first = array.pop
#   new_array = subsets(array)
#   new_array.each_with_index do |el , i|
#     arr << el + [first]
#   end
#   new_array + arr
# end

# def subsets(array)
#   return [[]] if array.empty?
# end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

def make_change(amount, den)
  # change = 0
  #return change if amount == 0
  # coin = 1
  # return coin if amount == 1
  # den.each do |el|
  #   break coin = el if amount >= el
  # end
  # [] << make_change(amount - coin, den)
  # #p amount
  # #change = 0
  # den.each do |coin|
  #   # change = coin if amount >= coin
  #   # amount -= change
  #   # result << make_change(amount, den)
  #   change = amount - coin if amount >= coin
  #   p change
  #   result << make_change(change,den)

  # end
# result

  result = []
  return result if amount == 0
  den.each do |coin|
    if amount > coin
      change = amount - coin
      result << coin
      make_change(change, den)
    else
      next
    end
  end
  # result  = []
  # return result if amount == 0
  # den.sort!
  # change = 0
  # if amount > den.last
  #   change = amount - den.last
  #   result << den.last
  #   make_change(change,den)
  #
end

def make_change(amount,den = [10, 7, 1])
  array = []
  coin = 1
  den.each do |el|
    break coin = el
  end
  return array if amount == coin

  array + make_change(amount - coin)

  
end

p make_change(14,[10, 7, 1])
