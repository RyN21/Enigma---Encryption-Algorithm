require './test/test_helper'
require './lib/offset'
require './lib/key'

class OffsetTest < Minitest::Test
  def test_it_exists_and_has_attributes
    offset = Offset.new(Date)

    assert_instance_of Offset, offset
  end

end
