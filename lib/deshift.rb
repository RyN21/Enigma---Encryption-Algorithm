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

  ### add to a module?!?! VV
  def find_index(data)
    chars = data.chars
    alphabet.index(chars[0])
  end

  def cycle_negative(index, shift_number)
    shifted = alphabet.rotate(-shift_number)
    shifted[index]
  end

  def deshift(message)
    chars = message.downcase.chars
    decrypted = []
    while chars.length > 0 do
      if chars.length > 0 && alphabet.include?(chars[0])
        decrypted << cycle_negative(find_index(chars[0]), @deshift_keys[:A])
      elsif chars.length > 0 && !alphabet.include?(chars[0])
        decrypted << chars[0]
      end
      chars.delete_at(0)
      if chars.length > 0 && alphabet.include?(chars[0])
        decrypted << cycle_negative(find_index(chars[0]), @deshift_keys[:B])
      elsif chars.length > 0 && !alphabet.include?(chars[0])
        decrypted << chars[0]
      end
      chars.delete_at(0)
      if chars.length > 0 && alphabet.include?(chars[0])
        decrypted << cycle_negative(find_index(chars[0]), @deshift_keys[:C])
      elsif chars.length > 0 && !alphabet.include?(chars[0])
        decrypted << chars[0]
      end
      chars.delete_at(0)
      if chars.length > 0 && alphabet.include?(chars[0])
        decrypted << cycle_negative(find_index(chars[0]), @deshift_keys[:D])
      elsif chars.length > 0 && !alphabet.include?(chars[0])
        decrypted << chars[0]
      end
      chars.delete_at(0)
    end
    decrypted.join
  end
end
