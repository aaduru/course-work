module Enumerable
  def my_each(&prc)
    idx = 0
    while idx < self.length
      prc.call(self[idx])
      idx += 1
    end
    self
  end


end
=begin
return_value = [1, 2, 3].my_each do |num|
  puts num
end.my_each do |num|
  puts num
end

p return_value
=end
class Array
  def my_select(&prc)
    arr = []
    self.my_each do |el|
      arr << el if prc.call(el)
    end
    arr
  end
  def my_reject(&prc)
    arr = []
    self.my_each do |el|
      arr << el if !prc.call(el)
    end
    arr
  end

  def my_any?(&prc)
    self.my_each do |el|
      return true if prc.call(el)
    end
    return false
  end

  def my_all?(&prc)
    self.my_each do |el|
      return false if !prc.call(el)
    end
    return true
  end

  def my_flatten
    arr = []

    self.each do |el|
      if el.is_a?(Integer)
        arr << el
      else
        arr.concat el.my_flatten
      end

    end
    arr
  end

  def my_zip(*arg)
    out = []
    self.each_with_index do |el, idx|
      temp = []
      temp << el
      arg.each do |el2|
        temp << el2[idx]
      end
      out << temp
    end
    out
  end

  def my_rotate(num = 1)
    arr = self
    if num > 0
      num.times do
        temp = arr.shift
        arr.push(temp)
      end
    else
      num = num * -1
      num.times do
        temp = arr.pop
        arr.unshift(temp)
      end
    end

    arr
  end

  def my_join(char = "")
    temp = ""
    self.each do |el|
      temp = temp + el + char
    end
    if temp[-1] == char
      temp = temp[0..-2]
    end
    temp
  end

  def my_reverse
    arr = []
    self.each do |el|
      arr.unshift(el)
    end
    arr
  end

end
=begin
a = [1, 2, 3]
p a.my_select { |num| num > 1 } # => [2, 3]
p a.my_select { |num| num == 4 } # => []
p a.my_reject { |num| num > 1 } # => [1]
p a.my_reject { |num| num == 4 } # => [1, 2, 3]
p a.my_any? { |num| num > 1 } # => true
p a.my_any? { |num| num == 4 } # => false
p a.my_all? { |num| num > 1 } # => false
p a.my_all? { |num| num < 4 } # => true

p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
p [1, 2].my_zip(a, b, c, d)

a = [ "a", "b", "c", "d" ]
p a.my_rotate
a = [ "a", "b", "c", "d" ]     #=> ["b", "c", "d", "a"]
p a.my_rotate(2)
a = [ "a", "b", "c", "d" ]   #=> ["c", "d", "a", "b"]
p a.my_rotate(-3)
a = [ "a", "b", "c", "d" ]    #=> ["b", "c", "d", "a"]
p a.my_rotate(15)

a = [ "a", "b", "c", "d" ]
p a.my_join         # => "abcd"
p a.my_join("$")    # => "a$b$c$d"
=end

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse  
