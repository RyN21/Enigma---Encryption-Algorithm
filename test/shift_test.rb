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
    assert_equal ({}), @shift.shift_keys
    assert_equal @key, @shift.key
    assert_equal @offset, @shift.offset
  end

  def test_it_has_alphabet
    @key = Key.new
    @offset = Offset.new
    @shift = Shift.new(@key, @offset)

    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @shift.alphabet
  end

  def test_it_can_merge_to_shift_key
    @key = Key.new
    @offset = Offset.new
    @shift = Shift.new(@key, @offset)
    @key.expects(:random_5digits).returns(['1', '0', '2', '4', '7'])
    @key.assign_keys
    @offset.change_date_format
    @offset.assign_offsets
    @shift.make_shift_keys

    expected = ({A: 14, B: 6, C: 24, D: 47})
    assert_equal expected, @shift.shift_keys
  end

  def test_it_find_index_in_alphabet
    @key = Key.new
    @offset = Offset.new
    @shift = Shift.new(@key, @offset)
    @key.expects(:random_5digits).returns(['1', '0', '2', '4', '7'])
    @key.assign_keys
    @offset.change_date_format
    @offset.assign_offsets
    @shift.make_shift_keys

    assert_equal 7, @shift.find_index('h')
  end

  def test_it_can_cycle
    @key = Key.new
    @offset = Offset.new
    @shift = Shift.new(@key, @offset)
    @key.expects(:random_5digits).returns(['1', '0', '2', '4', '7'])
    @key.assign_keys
    @offset.change_date_format
    @offset.assign_offsets
    @shift.make_shift_keys

    assert_equal 'i', @shift.cycle(2, 6)
  end

  def test_it_can_shift
    @key = Key.new
    @offset = Offset.new
    @shift = Shift.new(@key, @offset)
    @key.expects(:random_5digits).returns(['1', '0', '2', '4', '7'])
    @key.assign_keys
    @offset.change_date_format
    @offset.assign_offsets
    @shift.make_shift_keys

    assert_equal "vkieb", @shift.shift("hello")
    assert_equal "vkiebfthera", @shift.shift("heLLo world")
    assert_equal "vkieb,xpbxix!", @shift.shift("HEllo, wORLd!")
  end
end
