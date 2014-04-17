require 'operation'

class Parser
    
  def initialize(inputReader)
    if(inputReader.respond_to?('getInput') == false)
      raise 'getInput method is required'
    end
    operationString = inputReader.getInput
    operation = Operation.new(parse(operationString)) 
    @@result = operation.calculate.readResult
  end
  
  def getResult
    return @@result
  end
  
  private
  
  def parse(operationString)
    pattern = /(?<number>[+]?(\d*[.])?\d+)(?<operators>[-*+\/]{1})?/
    result = operationString.scan(pattern)
    returns = Array.new
    result.each do |match|
      match.each do |str|
        returns.push(str)
      end
    end
    return returns
  end
  
  
  
end