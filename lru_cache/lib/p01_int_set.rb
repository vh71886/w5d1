class MaxIntSet
  attr_accessor :store
  
  def initialize(max)
    @max = max
    @store = Array.new(@max, false) # init to max length, empty array
  end

  def insert(num)
    raise "Out of bounds" if num > @max || num < 0
    @store[num] = true
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
    self[num] << num if !include?(num)
  end

  def remove(num)
    return if !include?(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].each { |n| return true if n == num }
    false
  end

  private
  def [](num)
    # usage: self[num] == @store[num % num_buckets]
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
    if count > num_buckets - 1
      resize!
    end

    if !include?(num)
      self[num] << num 
      @count += 1
    end
  end

  def remove(num)
    return if !include?(num)
    self[num].delete(num)
    @count -= 1
  end

  def include?(num)
    self[num].each { |n| return true if n == num }
    false
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @store = Array.new(@store.length * 2) { Array.new }
    @count = 0

    old_store.each do |bucket|
      bucket.each do |num|
        insert(num)
      end
    end
  end
end
