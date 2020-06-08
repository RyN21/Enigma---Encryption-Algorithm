require './test/test_helper'
require './lib/enigma'
require './lib/offset'
require './lib/key'
require './lib/shift'
require './lib/deshift'

class EnigmaTest < Minitest::Test
  def test_it_exists_and_has_attributes
    @enigma = Enigma.new("Hello, world!", "10247", "080620")

    assert_instance_of Enigma, @enigma
    assert_equal "Hello, world!", @enigma.message
    assert_equal "10247", @enigma.key
    assert_equal "080620", @enigma.date
  end

  def test_it_can_encyrpt
    @enigma = Enigma.new("Hello, world!", "10247", "080620")
    @key = Key.new
    @offset = Offset.new
    @shift = Shift.new(@key, @offset)
    @key.expects(:random_5digits).returns(['1', '0', '2', '4', '7'])
    @key.assign_keys
    @date.assign_offsets
    @shift.make_shift_keys

    expected = ({
      encryption: "vkieb,xpbxix!",
      key: "10247",
      date: "080620"
    })

    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end
  #
  # def test_it_can_decrypt
  #   skip
  #   expected = {
  #     decryption: "hello world",
  #     key: "02715",
  #     date: "040895"
  #   }
  #
  #   assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  # end
  #
  # def test_it_can_encyrpt_with_todays_date
  #   skip
  #   @encrypted = @enigma.encrypt("hello world", "02715")
  #   assert_equal expected, @enigma.encrypt("hello world", "02715")
  # end
  #
  # def test_it_can_decyrpt_with_todays_date
  #   skip
  #   assert_equal expected, @enigma.decrypt(encrypted[:encryption], "02715")
  # end
  #
  # def test_it_can_encrypt_with_random_key_and_todays_date
  #   skip
  #   assert_equal expected, @enigma.encrypt("hello world")
  # end
end
