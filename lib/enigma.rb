require 'date'
require_relative 'shiftable'

class Enigma
  include Shiftable

  def initialize
    @alphabet = ("a".."z").to_a << " "
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

  def decrypt(decryption, key = generate_key, date = generate_date)
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
