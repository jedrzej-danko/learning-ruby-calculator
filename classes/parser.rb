require 'operation'

class Parser

  @@acceptedChars = /^([0-9\-*+\/]+)$/
  @@operationPattern = /(?<number>[+]?(\d*[.])?\d+)(?<operators>[-*+\/]{1})?/
    
  def initialize(inputReader)
    if(inputReader.respond_to?('getInput') == false)
      raise 'getInput method is required'
    end
    operationString = inputReader.getInput
    if valid?(operationString)
      @result = parse(operationString)
      if @result.length == 0
        raise "Empty operation"
      end      
    end
    
  end
  
  def getResult
    return @result
  end
  
  private
  
  def valid?(operationString)
    if ! @@acceptedChars.match(operationString)
      raise "Unaccepted chars in operation: #{operationString}"
    end
    if ! @@operationPattern.match(operationString)
      raise "Operation is malformed: {#operationString}"
    end
    return true
  end
  
  def parse(operationString) 
    result = operationString.scan(@@operationPattern)
    returns = Array.new
    result.each do |match|
      match.each do |str|
        if str != nil
          returns.push(str)          
        end
      end
    end
    return returns
  end
  
  
  
end