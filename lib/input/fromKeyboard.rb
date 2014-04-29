module Input
  
  class FromKeyboard
    
    def readInput
      puts("Enter operation: ")
      @command = gets
    end
    
    def getInput
      if(defined?(@command).nil?)
        readInput
      end
      return @command
    end
    
  end
end