# This works for shift factors that wrap once from z to a
# and for letters from a - Z (no accents)

def caesar_cipher
  puts 'Enter a text to encode!'
  string_to_encode = gets.chomp
  array_to_encode = string_to_encode.split('')
  puts 'Enter a shift factor!'
  shift_factor = gets.chomp.to_i
  encoded_array = array_to_encode.map { |character|
    convert_letter_to_number(character, shift_factor)
    }
  
  puts "The encoded version of the text is: #{encoded_array.join}"
  
end

def convert_letter_to_number(letter, shift)
  if letter.count('a-zA-Z') == 1 #checks if it is a letter
    if letter == letter.upcase
      up = true
    end
    letter = letter.downcase
    letter_code = letter.ord # gives the ASCII code of a letter
    encoded_letter_code = letter_code + shift
    if encoded_letter_code > 122
      encoded_letter_code = letter_code - 26 + shift # wraps from z to a
    end
    encoded_letter = encoded_letter_code.chr # gives letter from ASCII code
    if up == true
      encoded_letter = encoded_letter.upcase
    else
      encoded_letter
    end
  else
    encoded_letter = letter # any character which is not a letter is not encoded
  end
end

caesar_cipher