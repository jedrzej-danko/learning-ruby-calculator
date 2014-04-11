require_relative "classes/numberToText.rb"

(9 .. 21).to_a.each do |number|
  ntt = NumberToText.new(number)

  puts "#{ntt}"
end
