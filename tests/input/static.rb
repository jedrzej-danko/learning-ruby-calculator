
require 'test/unit'
require 'input/static'

    
class InputStaticTest < Test::Unit::TestCase
  
  def test_getInput
    obj = Input::Static.new('2+2')
    expected = obj.getInput
    assert_equal expected, '2+2'
  end
  
end
    
