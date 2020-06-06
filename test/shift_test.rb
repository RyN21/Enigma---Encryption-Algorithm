require './test/test_helper'
require './lib/offset'
require './lib/key'
require './lib/shift'

class ShiftTest < Minitest::Test
  def test_it_exists_and_has_attributes
    @key = Key.new
    @offset = Offset.new
    @shift = Shift.new(@key, @offset)

    assert_instance_of Shift, @shift
    assert_equal @key, @shift.key
    assert_equal @offset, @shift.offset
  end

  def test_it_can_shift
    @key = Key.new
    @offset = Offset.new
    @shift = Shift.new(@key, @offset)
    @key.expects(:random_5digits).returns(['1', '0', '2', '4', '7'])
    @key.assign_keys
    @offset.assign_offsets

    expected = ({A: 14, B: 6, C: 24, D: 47})
    assert_equal expected, @shift.shift
  end
end
