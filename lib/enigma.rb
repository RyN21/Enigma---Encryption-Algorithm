class Enigma
  attr_reader :message,
              :key,
              :date

  def initialize
    @message = message
    @key     = Key.new
    @date    = Offset.new
  end



  def encrypt(message, key, date)
    require "pry"; binding.pry
    key = Key.new
    @offset = Offset.new
    @shift = Shift.new(@key, @offset)
    @key.random_5digits
    @key.assign_keys
    @offset.assign_offsets
    @shift.make_shift_keys
  end
end
