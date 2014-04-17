$LOAD_PATH << './classes'

require 'input/fromKeyboard'
require 'input/static'
require 'parser'

require 'numberToText'
require 'i18n/pl/numberToText'
require 'i18n/en/numberToText'


input = Input::FromKeyboard.new
parser = Parser.new(input)

locale = I18n::En::NumberToText.new
ntt = NumberToText.new(parser.getResult.to_i, locale)

puts "Result is #{ntt}"


puts 'koniec'
