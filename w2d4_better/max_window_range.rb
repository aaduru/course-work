require 'byebug'
require_relative 'stacks_queues'
#O(n (n + n + n)) => O(n^2) quadratic
def windowed_max_range(array,window_size)
  current_range = nil
  max_range = 0

  array.each_with_index do |el,idx|
    window_array = array.slice(idx,window_size)
    current_range = window_array.max - window_array.min
    max_range = current_range if current_range > max_range
  end
  max_range
end


p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

def optimized_max_range(array, window_size)
  # debugger
  queue = MinMaxStackQueue.new
  window_size.times { |idx| queue.enqueue(array[idx]) }
  idx = window_size
  current_range = queue.max - queue.min
  max_range = queue.max - queue.min
  while idx < array.length
    queue.dequeue
    queue.enqueue(array[idx])
    current_range = queue.max - queue.min
    max_range = current_range if current_range > max_range
    idx += 1
  end
  max_range
end

p optimized_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p optimized_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p optimized_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p optimized_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
