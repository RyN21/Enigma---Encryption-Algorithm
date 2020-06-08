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
message_file = ARGV[0]
encrypted_file = ARGV[1]
puts "MESSAGE TO BE ENCRYPTED:"
puts "==================================="
puts File.read(message_file)
puts "==================================="
encrypted_file = @enigma.encrypt(File.read(message_file))
File.open("encrypted.txt", "w") { |f| f.write  "#{encrypted_file[:encryption]}" }
puts "ENCRYPTION CREATED:"
puts "==================================="
puts "#{encrypted_file[:encryption]}"
puts "==================================="
puts "CREATED WITH KEY:#{@enigma.key.five_digit_key}\nCREATED  WITH DATE#{@enigma.offset.date.to_i}"
puts "==================================="
