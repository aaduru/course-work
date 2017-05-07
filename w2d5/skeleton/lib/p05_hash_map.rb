require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    resize! if @count == num_buckets

    if bucket(key).include?(key)
      bucket(key).update(key, val)
    else
      bucket(key).append(key, val)
      @count += 1
    end
  end

  def get(key)
    bucket(key).get(key) if bucket(key).include?(key)
  end

  def delete(key)
    bucket(key).remove(key)
    @count -= 1
  end

  def each(&prc)
    @store.each do |link_list|
      link_list.each { |link| prc.call(link.key, link.val) }
    end

  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    temp_store = @store.dup

    @store = Array.new(num_buckets * 2) { LinkedList.new }
    @count = 0
    temp_pairs = []
    temp_store.each  do |link_list|
      link_list.each { |link| temp_pairs << [link.key, link.val] }
    end

    temp_pairs.each do |key, val|
      bucket(key).append(key, val)
    end

  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    @store[key.hash % num_buckets]
  end
end

# hash_map = HashMap.new(8)
# hash_map.set(:cool, 2)
# hash_map.set(:smile, 4)
# hash_map.set(:happy, 6)
# hash_map.set(:smile, 7)
# hash_map.delete(:cool)
#
# print hash_map.to_s
