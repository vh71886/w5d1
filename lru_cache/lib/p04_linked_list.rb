
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
  attr_reader :head, :tail

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
    self.head.next
  end

  def last
    self.tail.prev
  end

  def empty?
    first.next.nil?
  end

  def get(key)
    self.each { |node| return node.val if node.key == key }
  end

  def include?(key)
    node = first
    self.each { |node| return true if node.key == key }
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
    self.each { |node| node.val = val if node.key == key}
  end

  def remove(key)
    target = @head
    self.each { |node| target = node if node.key == key }

    target.prev.next = target.next
    target.next.prev = target.prev
  end

  def each
    node = self.head.next
    until node == self.tail
      yield node
      node = node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
