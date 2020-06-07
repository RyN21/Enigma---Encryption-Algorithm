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

  def cycle(index, shift_number)
    shifted = alphabet.rotate(shift_number)
    shifted[index]
  end

  def shift(message)
    chars = message.chars
    encrypted = []
    while chars.length > 0 do
      if chars.length > 0 && chars[0] == alphabet.any?
        @split_digits[:A]
        encrypted << chars.shift
      elsif chars.length > 0 && chars[0] == !alphabet.any?
        encrypted << chars.shift
      end
      if chars.length > 0 && chars[0] == alphabet.any?
        @split_digits[:B]
        encrypted << chars.shift
      elsif chars.length > 0 && chars[0] == !alphabet.any?
        encrypted << chars.shift
      end
      if chars.length > 0 && chars[0] == alphabet.any?
        @split_digits[:C]
        encrypted << chars.shift
      elsif chars.length > 0 && chars[0] == !alphabet.any?
        encrypted << chars.shift
      end
      if chars.length > 0 && chars[0] == alphabet.any?
        @split_digits[:D]
        encrypted << chars.shift
      elsif chars.length > 0 && chars[0] == !alphabet.any?
        encrypted << chars.shift
      end
    end
  end

    # alph_index = alphabet.index(chars[0])
    # alphabet[alph_index]
    # require "pry"; binding.pry


    # while chars.length > 0
    #   @shift_keys.each do |_, number|
    #     crypted << alphabet.index(chars[0])
    #     chars.shift
    #   end
    #   crypted
    # end


  # chars = message.chars
  # crypted = []
  # @shift_keys.each do |_, value|
  #   crypted << chars.rotate(value)
  # end
  # crypted

  # def cycle(message)
  #   chars = message.chars
  #   @shift_keys.until do |_, number|
  #     chars.map do |char|
  #       starting_index = alphabet.index(char)
  #     end
  #     @shift_keys.each do |key|
  #     end
  #   end
  # end

  def shift(message)
    message.chars.map do |char|
    end
  end
end
