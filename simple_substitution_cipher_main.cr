# an attempt to implement this cipher in crystal lang
# http://www.crypto-it.net/eng/simple/simple-substitution-ciphers.html

##########################################################################################
# Include functions from files
##########################################################################################

require "./simple_substitution_cipher_functions.cr"
include SimpleSubstitutionCipherFunctions

##########################################################################################
# Do stuff
##########################################################################################

alphabet_matches = define_encrypted_alphabet

puts ""

check_arguments(ARGV)

FILENAME=ARGV[0]

check_if_really_a_file(FILENAME)

# go over each line of the file
File.each_line(FILENAME) do |line|
	encrypt_line(alphabet_matches, line.upcase)
end
