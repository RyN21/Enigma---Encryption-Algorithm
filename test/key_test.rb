require './test/test_helper'
require './lib/key'

class KeyTest < Minitest::Test
  def test_it_exists_and_has_attributes
    @key = Key.new

    assert_instance_of Key, @key
  end

  def test_it_can_generate_5_random_numbers
    @key = Key.new
    # @key.expects(:random_digit_generator).returns("10247")
    assert_equal "10247", @key.random_digit_generator
  end

end
