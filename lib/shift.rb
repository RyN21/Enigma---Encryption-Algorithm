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

  def cycle(message)
    chars = message.chars
    crypted = []
    while chars.length > 0
      @shift_keys.each do |_, number|
        require "pry"; binding.pry
        alphabet.index(chars[0]).rotate(number)

          chars.shift
      
      end
    end
  end

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
