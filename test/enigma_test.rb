require_relative "test_helper"
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_it_returns_an_encrypted_message_given_key_and_date
    enigma = Enigma.new

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

  def test_it_can_get_key
    enigma = Enigma.new
    enigma.stubs(:rand).returns(8472)

    assert_equal '08472', enigma.generate_key
  end

  def test_it_can_get_date_offset
    enigma = Enigma.new
    Date.stubs(:today).returns(Date.new(2020, 9, 20))

    assert_equal [6,4,0,0], enigma.date_offset
  end

  def test_it_can_key_offset
    enigma = Enigma.new
    enigma.stubs(:rand).returns(48485)

    assert_equal ['48', '84', '48', '85'], enigma.key_offset
  end

  def test_it_can_key_offset_with_0_value_in_keys
    enigma = Enigma.new
    enigma.stubs(:generate_key).returns('00001')

    assert_equal ['00', '00', '00', '01'], enigma.key_offset
  end

  def test_it_can_get_shifts
    enigma = Enigma.new
    date_offset  = [6,4,0,0]
    key_offset = ['48', '84', '48', '85']

    expected = [54, 88, 48, 85]
    assert_equal expected, enigma.generate_shifts(date_offset, key_offset)
  end

  def test_it_returns_a_decrypted_message_given_key_and_date
    enigma = Enigma.new

    expected = {
                decryption: "hello world",
                key: "02715",
                date: "040895"
               }

    assert_equal expected, enigma.decrypt("keder ohulw", "02715", "040895")
  end
end
