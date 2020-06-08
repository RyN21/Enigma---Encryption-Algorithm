require './test/test_helper'
require './lib/enigma'
require './lib/offset'
require './lib/key'
require './lib/shift'
require './lib/deshift'

class EnigmaTest < Minitest::Test
  def test_it_exists_and_has_attributes
    @enigma = Enigma.new

    assert_instance_of Enigma, @enigma
  end

  def test_it_can_setup_keys_and_offsets
    assert_equal @enigma.setup
  end

  def test_it_can_encyrpt
    skip
    @enigma = Enigma.new
    @key = Key.new
    @offset = Offset.new
    @shift = Shift.new(@key, @offset)
    @key.expects(:random_5digits).returns(['1', '0', '2', '4', '7'])


    expected = ({
      encryption: "vkieb,xpbxix!",
      key: "10247",
      date: "080620"
    })

    assert_equal expected, @enigma.encrypt("Hello, world!", "02715", "040895")
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
