require './test/test_helper'
require './lib/enigma'
require './lib/offset'
require './lib/key'
require './lib/shift'
require './lib/deshift'

puts "-----------------"
puts "WELCOME TO ENIGMA"
puts "-----------------"
puts "-----------------"


@enigma = Enigma.new
message_file = ARGV[0]
encrypted_file = ARGV[1]
puts "THIS MESSAGE WILL BE ENCRYPTED:"
puts "-----------------"
puts File.read(message_file)
puts "-----------------"
puts @enigma.encrypt(File.read(message_file))
puts encrypted_file
require "pry"; binding.pry

puts "Created #{} with the key #{@enigma.key.five_digit_key} and date #{@enigma.offset.date.to_i}"
