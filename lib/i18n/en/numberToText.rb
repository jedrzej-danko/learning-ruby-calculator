module I18n
  module En
    class NumberToText
      
      public
      
      def getHundrets(hundrets)
        return @@hundrets[hundrets]
      end
      
      def getTens(tens)
        return @@tens[tens]
      end
      
      def getSingles(singles)
        return @@singles[singles]
      end
      
      private 
      
      @@singles = {1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine'}
      @@tens = {
        10 => 'ten', 11 => 'eleven', 12 => 'twelve', 13 => 'thirteen', 14 => 'fourteen', 
        15 => 'fiveteen', 16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen', 19 => 'nineteen',
        20 => 'twenty', 30 => 'thirty', 40 => 'fourty', 50 => 'fifty',
        60 => 'sixty', 70 => 'seventy', 80 => 'eighty', 90 => 'ninety'
      }
      @@hundrets = {
        100 => 'one hundret', 200 => 'two hundrets', 300 => 'three hundrets', 400 => 'four hundrets', 500 => 'five hundrets',
        600 => 'six hundrets', 700 => 'seven hundrets', 800 => 'eight hundrets', 900 => 'nine hundrets'
      }
      
    end
  end
end