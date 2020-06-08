class Enigma
  attr_reader :message,
              :key,
              :date

  def initialize
    @message = message
    @key     = Key.new
  end

  def encrypt(message, keys, date = Date.new)
    hash = Hash.new
    date = @offset.change_date_format if date == Date.new
    @key.pair_digits(keys.chars)
    @key.assign_keys
    @offset = Offset.new(date)
    @offset.assign_offsets
    @shift = Shift.new(@key, @offset)
    @shift.make_shift_keys
    hash[:encryption] = @shift.shift(message)
    hash[:key] = keys
    hash[:date] = date
    hash
  end
end
