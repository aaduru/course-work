require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
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

  def include?(num)
    self[num].include?(num)
  end

  def remove(num)
    self[num].delete(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]
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
