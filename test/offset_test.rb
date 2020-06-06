require './test/test_helper'
require './lib/offset'
require './lib/key'

class OffsetTest < Minitest::Test
  def test_it_exists_and_has_attributes
    @offset = Offset.new

    assert_instance_of Offset, @offset
    assert_equal Date.today, @offset.date
  end

  def test_it_can_change_date_format
    @offset = Offset.new
    # @offset2 = Offset.new("01/21/1990")
    @offset.change_date_format
    assert_equal '050620', @offset.date
    # assert_equal '210190', @offset2.date
  end

  def test_it_can_square_date
    @offset = Offset.new
    assert_equal 2562384400, @offset.date_squared
  end

  def test_it_can_take_last_4_digits_from_squared_date
    @offset = Offset.new
    assert_equal '4400', @offset.last_four_digits
  end

end
