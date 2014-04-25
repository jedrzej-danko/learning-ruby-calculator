class Operation < Array
  
  @@precedence = [['*', '/'], ['+', '-']]
  @@operators = ['+', '-', '/', '*']
  
  def calculate
    operation = self
    @@precedence.each do |operators|
      begin
        operation = operation.reduce(operators)
      end while operation.hasOperator?(operators)      
    end
    return operation         
  end
  
  def getResult
    numberOfImportantFields = 0
    self.each do |val|
      if val != nil 
        numberOfImportantFields += 1
      end
    end
    if numberOfImportantFields == 1
      return self[0]
    end
    raise "Calculation is not finished yet: more then one value in operation"
  end
  
  def hasOperator?(operators)
    if operators.respond_to?('each')
      operators.each do |operator|
         
        if hasOperator?(operator)
          return true
        end
      end 
      return false
    end
    return self.include?(operators)
  end
  
  def reduce(operators)
    self.each_index {|i|
      if operators.include?(self[i])
        self[i-1] = executeOperator(self[i], self[i-1], self[i+1]);
        self.delete_at(i+1)
        self.delete_at(i)
        
        return Operation.new(self)
      end              
    }
    return Operation.new(self)
  end
  
  private
  
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