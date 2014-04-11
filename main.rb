$LOAD_PATH << './classes'

require 'numberToText'
require 'i18n/en/numberToText'

# locale = I18n::Pl::NumberToText.new
locale = I18n::En::NumberToText.new

(18..22).to_a.each do |number|
  ntt = NumberToText.new(number, locale)

  puts "#{ntt}"
end
