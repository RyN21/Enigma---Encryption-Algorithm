require './test/test_helper'
require './lib/offset'
require './lib/key'

class OffsetTest < Minitest::Test
  def test_it_exists_and_has_attributes
    @offset = Offset.new

    assert_instance_of Offset, @offset
    assert_equal Date.today, @offset.date
    assert_equal ({A: 0, B: 0, C: 0, D: 0}), @offset.offsets
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
    assert_equal ['4', '4', '0', '0'], @offset.last_4_digits
  end

  def test_it_can_assign_offsets

    expected = ({A: '4', B: '4', C: '0', D: '0'})

    assert_equal expected, @offset.assign_offsets
  end

end
