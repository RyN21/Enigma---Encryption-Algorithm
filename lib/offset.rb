require 'date'

class Offset
  attr_reader :date,
              :offsets

  def initialize(date = Date.today)
    @date    = date
    @offsets = ({A: 0, B: 0, C: 0, D: 0})
  end

  def change_date_format
    @date = date.strftime('%d,%m,%y').delete(',')
  end

  def date_squared
    date.to_i * date.to_i
  end

  def last_4_digits
    array = date_squared.to_s.chars
    until array.length == 4 do array.shift end
    array
  end

  def assign_offsets
    array = last_4_digits
    @offsets = @offsets.transform_values do |offset|
      offset = array.shift
    end
  end
end
