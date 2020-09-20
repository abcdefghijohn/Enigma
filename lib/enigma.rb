require 'date'

class Enigma
  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def generate_date
    Date.today.strftime("%d%m%y")
  end
end
