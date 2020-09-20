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

  def test_it_can_get_date_key
    enigma = Enigma.new
    Date.stubs(:today).returns(Date.new(2020, 9, 20))

    assert_equal 40368846400, enigma.generate_date_key
  end

  def test_it_can_get_key
    enigma = Enigma.new
    enigma.stubs(:rand).returns(8472)

    assert_equal '08472', enigma.generate_key
  end

  def test_it_can_get_last_four
    enigma = Enigma.new
    Date.stubs(:today).returns(Date.new(2020, 9, 20))
    assert_equal [6,4,0,0], enigma.last_four_of_date
  end
end
