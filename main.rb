$LOAD_PATH << './classes'

require 'numberToText'

(9 .. 11).to_a.each do |number|
  ntt = NumberToText.new(number)

  puts "#{ntt}"
end
