require 'minitest/autorun'
require 'input/static'
require 'parser'

class ParserTest < MiniTest::Unit::TestCase
  
  def test_parser
    parser = Parser.new(Input::Static.new('2+2'))
    result = parser.getResult
    assert_instance_of(Array, result)
    assert_equal(3, result.length)
    assert_equal("2", result[0])
    assert_equal("+", result[1])
    assert_equal("2", result[2])
  end
  
  def test_parserFailure
    assert_raises(RuntimeError) {Parser.new(Input::Static.new('a+b'))}
    assert_raises(RuntimeError) {Parser.new(Input::Static.new('+*+3'))}
  end
  
end
