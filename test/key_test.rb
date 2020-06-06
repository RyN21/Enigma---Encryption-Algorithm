require './test/test_helper'
require './lib/key'

class KeyTest < Minitest::Test
  def test_it_exists_and_has_attributes
    @key = Key.new

    assert_instance_of Key, @key
  end

  def test_it_can_generate_5_random_numbers
    @key = Key.new
    @key.expects(:random_digit_generator).returns("10247")
    assert_equal "10247", @key.random_digit_generator
  end

  def test_it_can_assign_keys
    @key = Key.new
    @key.expects(:random_digit_generator).returns("10247")

    expected = ({A: 10, B: 02, C: 24, D: 47})
    assert_equal expected, @key.assign_keys
  end
end
