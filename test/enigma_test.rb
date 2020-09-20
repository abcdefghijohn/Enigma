require_relative "test_helper"
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_it_returns_an_encrypted_message
    skip
    enigma = Engima.new

    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
               }

    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_get_date
    enigma = Enigma.new
    Date.stubs(:today).returns(Date.new(2020, 9, 20))

    assert_equal '200920', enigma.generate_date 
  end
end
