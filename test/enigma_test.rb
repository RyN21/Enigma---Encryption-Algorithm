require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def test_it_exists_and_has_attributes
    @enigma = Enigma.new
    assert_instance_of Enigma, @enigma
  end

  # def test_it_can_encyrpt
  #   skip
  #   expected = ({
  #     encryption: "keder ohulw",
  #     key: "02715",
  #     date: "040895"
  #   })
  #
  #   assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  # end
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
