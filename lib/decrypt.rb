require_relative 'enigma'

handle = File.open(ARGV[0], 'r')

incoming_text = handle.read
handle.close

enigma = Enigma.new
decrypted = enigma.decrypt(incoming_text, ARGV[2], ARGV[3])

writer = File.open(ARGV[1], 'w')
writer.write(decrypted[:decryption])
writer.close

puts "Created #{ARGV[1]} with the key #{decrypted[:key]} and date #{decrypted[:date]}"
