class Parser
  
  @@operators = ['+', '-', '/', '*'] 
  
  def initialize(inputReader)
    if(inputReader.respond_to?('getInput') == false)
      raise 'getInput method is required'
    end
    @command = inputReader.getInput
    puts("Zadanie #{@command}")
    @@result = calculate
  end
  
  def getResult
    return @@result
  end
  
  private
  
  def parse
    pattern = /(?<number>[+]?(\d*[.])?\d+)(?<operators>[-*+\/]{1})?/
    result = @command.scan(pattern)
    returns = Array.new
    result.each {|match|
      match.each {|str|
        returns.push(str)
        } 
    }
    return returns
  end
  
  def calculate
    parts = parse
    reduced = Array.new
    # detect multiplying and dividing
    begin
      elements = reduce(parts, ['*', '/'])      
    end while hasOperator?(elements, ['*', '/'])
    begin
      elements = reduce(parts, ['+', '-'])
    end while hasOperator?(elements, ['+', '-'])
    
    return elements[0]
    
  end
  
  def reduce(elementsArray, operators)
    elementsArray.each_index {|i|
      if operators.include?(elementsArray[i])
        elementsArray[i-1] = executeOperator(elementsArray[i], elementsArray[i-1], elementsArray[i+1]);
        elementsArray.delete_at(i+1)
        elementsArray.delete_at(i)
        
        return elementsArray
      end              
    }
    return elementsArray
  end
  
  def hasOperator?(elements, operators)
    if operators.respond_to?('each')
      operators.each do |operator|
         
        if hasOperator?(elements, operator)
          return true
        end
      end 
      return false
    end
    return elements.include?(operators)
  end
  
  def executeOperator(operator, firstOperand, lastOperand)
    return case
    when operator.eql?('*') then multiply(firstOperand, lastOperand)
    when operator.eql?('/') then divide(firstOperand, lastOperand)
    when operator.eql?('-') then sub(firstOperand, lastOperand)
    when operator.eql?('+') then add(firstOperand, lastOperand)
    end
  end
  
  def multiply(n1, n2)
    return n1.to_f * n2.to_f
  end
  
  def divide(n1, n2)
    return n1.to_f / n2.to_f
  end
  
  def add(n1, n2)
    return n1.to_f + n2.to_f
  end
  
  def sub(n1, n2)
    return n1.to_f - n2.to_f
  end

end