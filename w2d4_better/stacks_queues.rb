class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    store.unshift(el)
  end

  def dequeue
    store.pop
  end

  def peek
    store.last
  end

  def size
    store.size
  end

  def empty?
    store.empty?
  end

  private

  attr_reader :store
end

class MyStack
  def initialize
    @store = []
  end

  def pop
    store.pop
  end

  def push(el)
    store.push(el)
  end

  def peek
    store.last
  end

  def size
    store.size
  end

  def empty?
    store.empty?
  end

  private

  attr_reader :store
end

class StackQueue
  def initialize
    @store = MyStack.new
    @temp = MyStack.new
  end

  def enqueue(el)
    @temp.push(el)
  end

  def dequeue
    if @store.empty?
      until @temp.empty?
        @store.push(@temp.pop)
      end
    end
    @store.pop
  end

  def peek
    @temp.peek || @store.peek
  end

  def size
    @store.size + @temp.size
  end

  def empty?
    @temp.empty? && @store.empty?
  end
end

class MaxStack

  def initialize
    @store = []
    @max = []
  end

  def pop
    if @store.last == @max.last
      @max.pop
    end
    @store.pop
  end

  def push(el)
    if @max.empty? || @max.last <= el
      @max.push(el)
    end
    @store.push(el)
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def max
    @max.last
  end

end

class MinMaxStack

  def initialize
    @store = []
    @max = []
    @min = []
  end

  def pop
    if @store.last == @max.last
      @max.pop
    end
    if @store.last == @min.last
      @min.pop
    end
    @store.pop
  end

  def push(el)
    if @max.empty? || @max.last <= el
      @max.push(el)
    end
    if @min.empty? || @min.last >= el
      @min.push(el)
    end
    @store.push(el)
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def max
    @max.last
  end

  def min
    @min.last
  end


end

class MinMaxStackQueue
  def initialize
    @store = MinMaxStack.new
    @temp = MinMaxStack.new
  end

  def enqueue(el)
    @temp.push(el)
  end

  def dequeue
    if @store.empty?
      until @temp.empty?
        @store.push(@temp.pop)
      end
    end
    @store.pop
  end

  def peek
    @temp.peek || @store.peek
  end

  def size
    @store.size + @temp.size
  end

  def empty?
    @temp.empty? && @store.empty?
  end

  def max
    return @store.max if @temp.empty?
    return @temp.max if @store.empty?
    @store.max > @temp.max ? @store.max : @temp.max
  end

  def min
    return @store.min if @temp.empty?
    return @temp.min if @store.empty?
    @store.min < @temp.min ? @store.min : @temp.min
  end
end
