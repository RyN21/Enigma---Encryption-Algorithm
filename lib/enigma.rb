class Enigma
  attr_reader :message,
              :key,
              :date

  def initialize
    @message = message
    @key     = Key.new
  end

  def encrypt(message, keys = @key.random_5digits.join, date = Date.today)
    encrypted = Hash.new
    @key.pair_digits(keys.chars)
    @key.assign_keys
    @offset = Offset.new(date)
    date = @offset.change_date_format if date == Date.today
    @offset.assign_offsets
    @shift = Shift.new(@key, @offset)
    @shift.make_shift_keys
    encrypted[:encryption] = @shift.shift(message)
    encrypted[:key] = keys
    encrypted[:date] = date
    encrypted
  end

  def decrypt(message, keys, date = Date.today)
    encrypted = Hash.new
    @key.pair_digits(keys.chars)
    @key.assign_keys
    @offset = Offset.new(date)
    date = @offset.change_date_format if date == Date.today
    @offset.assign_offsets
    @deshift = Deshift.new(@key, @offset)
    @deshift.make_deshift_keys
    encrypted[:decryption] = @deshift.deshift(message)
    encrypted[:key] = keys
    encrypted[:date] = date
    encrypted
  end
end
