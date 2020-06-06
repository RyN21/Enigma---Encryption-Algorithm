require 'date'

class Offset
  attr_reader :date

  def initialize(date = Date.today)
    @date = date
  end

  def change_date_format
    @date = date.strftime('%d,%m,%y').delete(',')
  end
end
