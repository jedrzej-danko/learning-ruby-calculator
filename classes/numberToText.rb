class NumberToText
  def initialize(number)
    @number = number
  end

  def render
    return " #{@number}: #{getHundretsAsText} #{getTensAsText} #{getSinglesAsText}"
  end

  def to_s
    return render
  end


  private

  @@singles = {1 => 'jeden', 2 => 'dwa', 3 => 'trzy', 4 => 'cztery', 5 => 'piec', 6 => 'szesc', 7 => 'siedem', 8 => 'osiem', 9 => 'dziewiec'}
  @@tens = {
    10 => 'dziesiec', 11 => 'jedenascie', 12 => 'dwanascie', 13 => 'trzynascie', 14 => 'czternascie', 
    15 => 'pietnascie', 16 => 'szesnascie', 17 => 'siedemnascie', 18 => 'osiemnascie', 19 => 'dziewietnascie',
    20 => 'dwadziescia', 30 => 'trzydziesci', 40 => 'czterdziesci', 50 => 'piecdziesiat',
    60 => 'szescdziesiat', 70 => 'siedemdziesiat', 80 => 'osiemdziesiat', 90 => 'dziewiecdziesiat'
  }
  @@hundrets = {
    100 => 'sto', 200 => 'dwiescie', 300 => 'trzysta', 400 => 'czterysta', 500 => 'piecset',
    600 => 'szescset', 700 => 'siedemset', 800 => 'osiemset', 900 => 'dziewiecset'
  }

  def getHundrets()
    s = @number.to_i / 100
    return s.round * 100;
  end

  def getHundretsAsText()
    hundrets = getHundrets()
    return @@hundrets[hundrets]
  end

  def getTens()
    s = (@number.to_i - getHundrets()) / 10.to_f
    if(s >= 1 and s < 2) 
      return s * 10
    else
      return s.round * 10
    end
  end

  def getTensAsText()
    d = getTens.to_i
    return @@tens[d]
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
    return @@singles[j]
  end


end