module Input
  
  class FromKeyboard
    
    def readInput
      puts("Wprowadz dzialanie: ")
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