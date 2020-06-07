class Deshift
  attr_reader :shift_keys, :key, :date, :alphabet

  def initialize(key, date)
    @shift_keys = {}
    @key        = key
    @date       = date
    @alphabet   = ("a".."z").to_a << " "
  end

end
