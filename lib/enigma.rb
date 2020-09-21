require 'date'

class Enigma
  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def generate_date
    Date.today.strftime("%d%m%y")
  end

  def date_offset(date = generate_date)
    squared = date.to_i ** 2
    squared.digits.reverse[-4..-1]
  end

  def generate_key
    rand(9999).to_s.rjust(5, "0")
  end

  def key_offset(key = generate_key)
    a = key[0..1]
    b = key[1..2]
    c = key[2..3]
    d = key[3..4]
    [a,b,c,d]
  end

  def generate_shifts(date, key)
    numbers = key.map do |number|
      number.to_i
    end
    numbers.zip(date).map do |offset, key|
      offset + key
    end
  end

end


# convert to integers
# add shifts in order
# then convert back chars





# 1. need date
# 2. need key
# 3. need to assign key according to ABCD
# 4. need to square date
# 5. need to grab last 4
# 6. need to offset ABCD accordingly to last 4
# 7. need to encryt using ABCD
