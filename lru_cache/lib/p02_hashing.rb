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
    h = 0
    self.sort_by { |k, v| k }.each do |k,v|
      if k.is_a?(Symbol)
        k = k.to_s.to_i(36)
      end

      if v.is_a?(String)
        v = v.to_i(36)
      end

      h += (h + k + v).hash
    end
    # 0
    h
  end
end
