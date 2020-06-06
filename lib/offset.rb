require 'date'

class Offset
  attr_reader :date

  def initialize(date = Date.today)
    @date = date
  end

  def change_date_format
    @date = date.strftime('%d,%m,%y').delete(',')
  end

  def date_squared
    change_date_format
    date.to_i * date.to_i
  end
end
