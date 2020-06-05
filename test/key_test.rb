require './test/test_helper'
require './lib/key'

class KeyTest < Minitest::Test
  def test_it_exists_and_has_attributes
    @a_key = Key.new
    @b_key = Key.new
    @c_key = Key.new
    @d_key = Key.new
    assert_instance_of Key, @a_key
  end

end
