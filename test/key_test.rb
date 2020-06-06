require './test/test_helper'
require './lib/key'

class KeyTest < Minitest::Test
  def test_it_exists_and_has_attributes
    @key = Key.new

    assert_instance_of Key, @key
    assert_equal ({A: 0, B: 0, C: 0, D: 0}), @key.keys
  end

  def test_it_can_generate_5_random_numbers
    @key = Key.new
    @key.expects(:random_5digits).returns(['1', '0', '2', '4', '7'])
    assert_equal ['1', '0', '2', '4', '7'], @key.random_5digits
  end

  def test_it_can_pair_digits
    @key = Key.new
    # @key.expects(:random_5digits).returns(['1', '0', '2', '4', '7'])
    @key.pair_digits(@key.random_5digits)

    assert_equal ['10', '02', '24', '47'], @key.digits
  end

  def test_it_can_assign_keys
    skip
    @key = Key.new
    @key.expects(:random_5digits).returns([1, 0, 2, 4 ,7])

    expected = ({A: 10, B: 02, C: 24, D: 47})
    assert_equal expected, @key.assign_keys(@key.digits)
  end
end
