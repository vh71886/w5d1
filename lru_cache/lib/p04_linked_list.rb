
class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

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
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    first.next.nil?
  end

  def get(key)

  end

  def include?(key)
    node = first
    # until node.next == nil
    #   return true if node.key == key
    # end
    false
  end

  def append(key, val)
    if !include?(key)
      node = Node.new(key, val)
      node.next = @tail
      node.prev = last
      last.next = node
      @tail.prev = node
    end
  end

  def update(key, val)

  end

  def remove(key)

  end

  def each

  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
