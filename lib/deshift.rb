class Deshift
  attr_reader :deshift_keys, :key, :offset, :alphabet

  def initialize(key, offset)
    @deshift_keys = {}
    @key        = key
    @offset     = offset
    @alphabet   = ("a".."z").to_a << " "
  end

  def make_deshift_keys
    @deshift_keys = @key.keys.merge!(@offset.offsets) do |s, k, o|
      k.to_i + o.to_i
    end
  end

end
