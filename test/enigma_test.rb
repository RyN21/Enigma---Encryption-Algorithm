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

  def test_it_can_encyrpt
    @enigma = Enigma.new

    expected = ({
      encryption: "keder,sprrdx!",
      key: "02715",
      date: "040895"
    })

    assert_equal expected, @enigma.encrypt("Hello, world!", "02715", "040895")
  end

  def test_it_can_decrypt
    @enigma = Enigma.new

    expected = ({
      decryption: "hello, world!",
      key: "02715",
      date: "040895"
    })

    assert_equal expected, @enigma.decrypt("keder,sprrdx!", "02715", "040895")
  end

  def test_it_can_encyrpt_with_todays_date
    @enigma = Enigma.new

    expected = ({
      encryption: "nib u,qkuvbs!",
      key: "02715",
      date: "090620"
    })

    assert_equal expected, @enigma.encrypt("hello, world!", "02715")
  end

  def test_it_can_decyrpt_with_todays_date
    @enigma = Enigma.new

    expected = ({
      decryption: "hello, world!",
      key: "02715",
      date: "090620"
      })

    assert_equal expected, @enigma.decrypt("nib u,qkuvbs!", "02715")
  end

  def test_it_can_encrypt_with_random_key_and_todays_date
    skip
    @enigma = Enigma.new

    expected = ({
      encryption: "hello, world!",
      key: "02715",
      date: "00620"
      })

    assert_equal expected, @enigma.encrypt("hello, world!")
  end
end
