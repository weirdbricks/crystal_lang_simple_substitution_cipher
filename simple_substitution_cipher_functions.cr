# an attempt to implement this cipher in crystal lang
# http://www.crypto-it.net/eng/simple/simple-substitution-ciphers.html

module SimpleSubstitutionCipherFunctions
	extend self

	# first let's define the alphabet
	def define_encrypted_alphabet
		# we define a string containing the alphabet
		alphabet="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
		# we split the string into an array
		alphabet_array=alphabet.split("")
		# and print it out
		puts "Old Alphabet: #{alphabet_array}"
		# define a new array which is the previous array but randomized
		randomized_alphabet_array=alphabet_array.shuffle
		puts "New Alphabet: #{randomized_alphabet_array}"
	
		# use the zip function to create a hash from the two arrays 
		# reference: https://crystal-lang.org/api/0.34.0/Hash.html#zip(ary1:Array(K),ary2:Array(V))-class-method
		alphabet_matches=Hash.zip(alphabet_array, randomized_alphabet_array)
	        puts "Alphabet matches:"
		alphabet_matches.each do |key, value|
			puts "#{key} = #{value}" 
		end
		puts "============================="
		puts "KEY: #{randomized_alphabet_array.join}"
	        puts "============================="
	
		return alphabet_matches
	end

	# take a line and "encrypt" it
	def encrypt_line(alphabet_matches, line)
		encrypted_line=""
		line.each_char do |letter|
			if alphabet_matches.keys.includes?(letter.to_s)
				encrypted_line="#{encrypted_line}#{alphabet_matches[letter.to_s.upcase]}"
			else
				encrypted_line="#{encrypted_line}#{letter}"
			end
		end
		puts "#{encrypted_line}"
		return encrypted_line
	end

	def check_arguments(arguments)
		if arguments.size != 1
			abort "Need exactly one file to be passed as an argument"
		end
	end

	def check_if_really_a_file(filename)
		if File.file?(filename)
			puts "OK, encrypting file: #{filename}"
		else
			abort "#{filename} is not a file - bailing"
		end
	end
end
