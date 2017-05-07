require "byebug"
class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @prev.next = @next
    @next.prev = @prev

  end
end

class LinkedList
  include Enumerable

  attr_reader :head, :tail
  def initialize
    @head = Link.new()
    @tail = Link.new()
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    if @head.next == @tail
      @head
    else
      @head.next
    end
  end

  def last
    if @tail.prev == @head
      @tail
    else
      @tail.prev
    end
  end

  def empty?
    head_test = @head.next == @tail
    tail_test = @tail.prev == @head
    head_test && tail_test
  end

  def get(key)
    return nil if empty?

    test_node = @head
    until test_node.next.nil?
      test_node = test_node.next
      return test_node.val if test_node.key == key
    end
    nil
  end

  def include?(key)
    return false if empty?

    test_node = @head
    until test_node.next.nil?
      test_node = test_node.next
      return true if test_node.key == key
    end
    false

  end

  def append(key, val)

    key = Link.new(key,val)
    temp_prev_next = @tail.prev
    @tail.prev = key
    key.next = @tail
    temp_prev_next.next = key
    key.prev = temp_prev_next
  end

  def update(key, val)
    if @tail.prev.key == key
      @tail.prev.val = val
    end
  end

  def remove(key)
    return nil if empty?
    test_node = @head
    until test_node.next.nil?
      test_node = test_node.next
      if test_node.key == key
        test_node.remove
      end
    end
    nil
  end

  def each(&prc)
    return nil if empty?

    test_node = @head
    until test_node.next.val.nil?
      test_node = test_node.next
      prc.call(test_node)
    end

  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end


# link = LinkedList.new
# link.append(:first,1)
# link.append(:firs,1)
# link.append(:firt,1)
# link.append(:fist,1)
#
# p link.to_s
