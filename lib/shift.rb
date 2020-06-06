class Shift
  attr_reader :key, :offset

  def initialize(key, offset)
    @shift = Hash.new(0)
    @key = key
    @offset = offset
  end

  def alphabet
    ("a".."z").to_a << " "
  end

  def shift
    @shift = @key.keys.merge!(@offset.offsets) do |s, k, o|
      k.to_i + o.to_i
    end
  end
end
