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

  def encrypt(encryption, key = generate_key, date = generate_date)
    encrypted = ""
    shifts = generate_shifts(date_offset(date), key_offset(key))
    encryption.chars.each do |letter|
      encrypted << letter.tr(@alphabet.join, @alphabet.rotate(shifts[0]).join)
      shifts.rotate!(1)
    end
    encrypted_message(encrypted, key, date)
  end

  def encrypted_message(encrypted, key, date)
    {
      encryption: encrypted,
      key: key,
      date: date
    }
  end

  def decrypt(decryption, key, date = generate_date)
    decrypted = ""
    unshifts = generate_shifts(date_offset(date), key_offset(key))
    decryption.chars.each do |letter|
      decrypted << letter.tr(@alphabet.join, @alphabet.rotate(-unshifts[0]).join)
      unshifts.rotate!(1)
    end
    decrypted_message(decrypted, key, date)
  end

  def decrypted_message(decrypted,key, date)
    {
      decryption: decrypted,
      key: key,
      date: date
    }
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
