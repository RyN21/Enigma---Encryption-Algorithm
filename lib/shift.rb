class Shift
  attr_reader :shift_keys, :key, :offset, :alphabet

  def initialize(key, offset)
    @shift_keys = {}
    @key = key
    @offset = offset
    @alphabet = []
  end

  def alphabet
    @alphabet = ("a".."z").to_a << " "
  end

  def merge_to_shift_keys
    @shift_keys = @key.keys.merge!(@offset.offsets) do |s, k, o|
      k.to_i + o.to_i
    end
  end


end
