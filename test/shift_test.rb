require './test/test_helper'
require './lib/offset'
require './lib/key'
require './lib/shift'

class ShiftTest < Minitest::Test
  def test_it_exists_and_has_attributes
    @key = Key.new
    @offset = Offset.new
    @shift = Shift.new(@key, @offset)
    @key.expects(:random_5digits).returns(['1', '0', '2', '4', '7'])

    assert_instance_of Shift, @shift
    assert_equal @key, @shift.key
    assert_equal @offset, @shift.offset
  end


end
