require './test/test_helper'
require './lib/offset'
require './lib/key'
require './lib/deshift'

class DeshiftTest < Minitest::Test
  def test_it_exists_and_has_attributes
    @key = Key.new
    @offset = Offset.new
    @deshift = Deshift.new(@key, @offset)

    assert_instance_of Deshift, @deshift
    assert_equal ({}), @deshift.deshift_keys
    assert_equal @key, @deshift.key
    assert_equal @offset, @deshift.offset
  end

  def test_it_has_alphabet
    @key = Key.new
    @offset = Offset.new
    @deshift = Deshift.new(@key, @offset)

    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @deshift.alphabet
  end

  def test_it_can_merge_to_deshift_key
    @key = Key.new
    @offset = Offset.new
    @deshift = Deshift.new(@key, @offset)
    @key.expects(:random_5digits).returns(['1', '0', '2', '4', '7'])
    @key.pair_digits
    @key.assign_keys
    @offset.change_date_format
    @offset.assign_offsets

    expected = ({A: 14, B: 6, C: 24, D: 47})
    assert_equal expected, @deshift.make_deshift_keys
  end

  def test_it_find_index_in_alphabet
    @key = Key.new
    @offset = Offset.new
    @deshift = Deshift.new(@key, @offset)
    @key.expects(:random_5digits).returns(['1', '0', '2', '4', '7'])
    @key.pair_digits
    @key.assign_keys
    @offset.change_date_format
    @offset.assign_offsets
    @deshift.make_deshift_keys

    assert_equal 7, @deshift.find_index('h')
  end

  def test_it_can_cycle_negative
    @key = Key.new
    @offset = Offset.new
    @deshift = Deshift.new(@key, @offset)
    @key.expects(:random_5digits).returns(['1', '0', '2', '4', '7'])
    @key.pair_digits
    @key.assign_keys
    @offset.change_date_format
    @offset.assign_offsets
    @deshift.make_deshift_keys

    assert_equal 'x', @deshift.cycle_negative(2, 6)
  end

  def test_it_can_deshift
    @key = Key.new
    @offset = Offset.new
    @deshift = Deshift.new(@key, @offset)
    @key.expects(:random_5digits).returns(['1', '0', '2', '4', '7'])
    @key.pair_digits
    @key.assign_keys
    @offset.change_date_format
    @offset.assign_offsets
    @deshift.make_deshift_keys

    assert_equal "hello", @deshift.deshift("vkieb")
    assert_equal "hello world", @deshift.deshift("vkiebfthera")
    assert_equal "hello, world!", @deshift.deshift("vkieb,xpbxix!")
  end
end
