require_relative "test_helper"
require './lib/enigma'
require './lib/shifter'

class ShifterTest < Minitest::Test
  def test_it_exists_and_has_attributes
    shifter = Shifter.new

    assert_instance_of Shifter, shifter
    assert_equal 27, shifter.alphabet.count 
  end
end
