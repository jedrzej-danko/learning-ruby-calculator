$LOAD_PATH << './classes'

require 'input/fromKeyboard'
require 'input/static'
require 'parser'
require 'operation'

require 'numberToText'
require 'i18n/pl/numberToText'
require 'i18n/en/numberToText'


input = Input::FromKeyboard.new
operation = Operation.new(Parser.new(input))

result = operation.calculate.readResult

locale = I18n::En::NumberToText.new
ntt = NumberToText.new(result.to_i, locale)

puts "Result is #{ntt}"
