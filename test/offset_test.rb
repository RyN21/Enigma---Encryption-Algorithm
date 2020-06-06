require './test/test_helper'
require './lib/offset'
require './lib/key'

class OffsetTest < Minitest::Test
  def test_it_exists_and_has_attributes
    @offset = Offset.new

    assert_instance_of Offset, @offset
    assert_equal Date.today, @offset.date
  end

  def test_it_can_change_date_format
    @offset = Offset.new
    @offset.change_date_format
    assert_equal '050620', @offset.date
  end

end
