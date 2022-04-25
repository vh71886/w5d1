class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    return 0.hash if self.empty?
    self[1..-1].inject(self.first) do |accul, ele|
      (accul + ele).hash
    end
  end
end

class String
  def hash
    num = self.to_i(36)
    num.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash

    
    0
  end
end
