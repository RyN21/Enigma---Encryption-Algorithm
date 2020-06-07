class Shift
  attr_reader :shift_keys, :key, :offset, :alphabet

  def initialize(key, offset)
    @shift_keys = {}
    @key = key
    @offset = offset
    @alphabet = ("a".."z").to_a << " "
  end

  def merge_to_shift_keys
    @shift_keys = @key.keys.merge!(@offset.offsets) do |s, k, o|
      k.to_i + o.to_i
    end
  end

  def find_index(data)
    chars = data.chars
    alphabet.index(chars[0])
  end

  def cycle(index, shift_number)
    shifted = alphabet.rotate(shift_number)
    shifted[index]
  end

  def shift(message)
    chars = message.chars
    encrypted = []
    while chars.length > 0 do
      if chars.length > 0 && alphabet.include?(chars[0])
        encrypted << cycle(find_index(chars[0]), @shift_keys[:A])
      elsif chars.length > 0 && !alphabet.include?(chars[0])
        encrypted << chars[0]
      end
      chars.delete_at(0)
      if chars.length > 0 && alphabet.include?(chars[0])
        encrypted << cycle(find_index(chars[0]), @shift_keys[:B])
      elsif chars.length > 0 && !alphabet.include?(chars[0])
        encrypted << chars[0]
      end
      chars.delete_at(0)
      if chars.length > 0 && alphabet.include?(chars[0])
        encrypted << cycle(find_index(chars[0]), @shift_keys[:C])
      elsif chars.length > 0 && !alphabet.include?(chars[0])
        encrypted << chars[0]
      end
      chars.delete_at(0)
      if chars.length > 0 && alphabet.include?(chars[0])
        encrypted << cycle(find_index(chars[0]), @shift_keys[:D])
      elsif chars.length > 0 && !alphabet.include?(chars[0])
        encrypted << chars[0]
      end
      chars.delete_at(0)
    end
    encrypted.join
  end
end
