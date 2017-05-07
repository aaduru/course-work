class MaxIntSet

  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" if num > (@store.length - 1) || num < 0

    unless include?(num)
      @store[num] = true
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private


  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)

    unless include?(num)
      self[num] << num
    end
  end

  def remove(num)

    self[num].delete(num)
  end

  def include?(num)

    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
      @store[num % num_buckets]

  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count == num_buckets

    unless self[num].include?(num)
      @count += 1
      self[num] << num
    end

  end

  def remove(num)

    self[num].delete(num)
  end

  def include?(num)

    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]

  end

  def num_buckets
    @store.length
  end

  def resize!
    temp_store = @store.dup.flatten
    if @count == num_buckets
      @store = Array.new(num_buckets * 2) { Array.new }
      @count =0
      temp_store.each  do |element|
        insert(element)
      end
    end
  end
end
