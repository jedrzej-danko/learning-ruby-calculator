module Input
  class Static
    def initialize(command)
      @command = command
    end
    
    def getInput
      return @command
    end
  end
end