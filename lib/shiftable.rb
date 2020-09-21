module Shiftable

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
