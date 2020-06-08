require './test/test_helper'
require './lib/enigma'
require './lib/offset'
require './lib/key'
require './lib/shift'
require './lib/deshift'

puts "==================================="
puts "WELCOME TO ENIGMA"
puts "==================================="
@enigma = Enigma.new
encrypted_file = ARGV[0]
decrypted_file = ARGV[1]
key = ARGV[2]
date = ARGV[3]
puts "MESSAGE TO BE DECRYPTED:"
puts "==================================="
puts File.read(encrypted_file)
puts "==================================="
decrypted_file = @enigma.decrypt(File.read(encrypted_file), key, date)
File.open("decrypted.txt", "w") { |f| f.write  "#{decrypted_file[:decryption]}" }
puts "DECRYPTION CREATED:"
puts "==================================="
puts "#{decrypted_file[:decryption]}"
puts "==================================="
puts "CREATED WITH KEY: #{@enigma.key.five_digit_key}\nCREATED  WITH DATE: #{@enigma.offset.date.to_i}"
puts "==================================="
