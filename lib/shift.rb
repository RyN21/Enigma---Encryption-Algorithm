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
      if chars.length > 0 && alphabet.include?(chars[0])
        require "pry"; binding.pry
        encrypted << cycle(0, @shift_keys[:A])
      elsif chars.length > 0 && !alphabet.include?(chars[0])
        encrypted << chars[0]
      end
      chars.delete_at(0)
      if chars.length > 0 && alphabet.include?(chars[0])
        encrypted << cycle(0, @shift_keys[:B])
      elsif chars.length > 0 && !alphabet.include?(chars[0])
        encrypted << chars[0]
      end
      chars.delete_at(0)
      if chars.length > 0 && alphabet.include?(chars[0])
        encrypted << cycle(0, @shift_keys[:C])
      elsif chars.length > 0 && !alphabet.include?(chars[0])
        encrypted << chars[0]
      end
      chars.delete_at(0)
      if chars.length > 0 && alphabet.include?(chars[0])
        encrypted << cycle(0, @shift_keys[:D])
      elsif chars.length > 0 && !alphabet.include?(chars[0])
        encrypted << chars[0]
      end
      chars.delete_at(0)
    end
    encrypted
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


end
