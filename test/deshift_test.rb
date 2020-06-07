require './test/test_helper'
require './lib/offset'
require './lib/key'
require './lib/deshift'

class DeshiftTest < Minitest::Test
  def test_it_exists_and_has_attributes
    @key = Key.new
    @offset = Offset.new
    @deshift = Deshift.new(@key, "June 6, 2020")

    assert_instance_of Deshift, @deshift
    assert_equal ({}), @deshift.shift_keys
    assert_equal @key, @deshift.key
    assert_equal "June 6, 2020", @deshift.date
  end

  def test_it_has_alphabet
    @key = Key.new
    @offset = Offset.new
    @deshift = Deshift.new(@key, @offset)

    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @deshift.alphabet
  end

  def test_it_can_merge_to_shift_key
    skip
    @key = Key.new
    @offset = Offset.new
    @deshift = Deshift.new(@key, @offset)
    @key.expects(:random_5digits).returns(['1', '0', '2', '4', '7'])
    @key.assign_keys
    @offset.assign_offsets

    expected = ({A: 14, B: 6, C: 24, D: 47})
    assert_equal expected, @deshift.make_shift_keys
  end

  def test_it_find_index_in_alphabet
    skip
    @key = Key.new
    @offset = Offset.new
    @deshift = Deshift.new(@key, @offset)
    @key.expects(:random_5digits).returns(['1', '0', '2', '4', '7'])
    @key.assign_keys
    @offset.assign_offsets
    @deshift.make_shift_keys

    assert_equal 7, @deshift.find_index('h')
  end

  def test_it_can_cycle
    skip
    @key = Key.new
    @offset = Offset.new
    @deshift = Deshift.new(@key, @offset)
    @key.expects(:random_5digits).returns(['1', '0', '2', '4', '7'])
    @key.assign_keys
    @offset.assign_offsets
    @deshift.make_shift_keys

    assert_equal 'i', @deshift.cycle(2, 6)
  end

  def test_it_can_shift
    skip
    @key = Key.new
    @offset = Offset.new
    @deshift = Deshift.new(@key, @offset)
    @key.expects(:random_5digits).returns(['1', '0', '2', '4', '7'])
    @key.assign_keys
    @offset.assign_offsets
    @deshift.make_shift_keys

    assert_equal "hello", @deshift.deshift("vkieb")
    assert_equal "heLLo world", @deshift.deshift("vkiebfthera")
    assert_equal "HEllo, wORLd!", @deshift.deshift("vkieb,xpbxix!")
  end
end
