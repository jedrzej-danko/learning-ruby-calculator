class NumberToText
  def initialize(number, locale)
    @number = number
    @locale = locale
  end

  def render
    return " #{@number}: #{getHundretsAsText} #{getTensAsText} #{getSinglesAsText}"
  end

  def to_s
    return render
  end


  private

  def getHundrets()
    s = @number.to_i / 100
    return s.round * 100;
  end

  def getHundretsAsText()
    hundrets = getHundrets()
    return @locale.getHundrets(hundrets)
  end

  def getTens()
    s = (@number.to_i - getHundrets()) / 10.to_f
    if(s < 1)
      return 0
    elsif(s >= 1.to_f and s < 2.to_f) 
      return s * 10
    else
      return s.to_i * 10
    end
  end

  def getTensAsText()
    d = getTens.to_i
    puts "Tens: #{d}"
    return @locale.getTens(d);
  end

  def getSingles()
    d = getTens
    if(d >= 10 and d < 20) 
      return 0
    else
      return @number % 10
    end
  end

  def getSinglesAsText()
    j = getSingles
    return @locale.getSingles(j)
  end


end