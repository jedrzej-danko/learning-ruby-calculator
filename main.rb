$LOAD_PATH << './classes'

require 'numberToText'
require 'i18n/pl/numberToText'

locale = I18n::Pl::NumberToText.new

(1..8).to_a.each do |number|
  ntt = NumberToText.new(number, locale)

  puts "#{ntt}"
end
