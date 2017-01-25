class House
  ##
  # @param num [Integer]
  #
  # @return [String] the line
  def line(num)
    Lines.new.to_a[num - 1]
  end

  ##
  # @return [String] the song
  def recite
    Lines.new.to_a.join("\n")
  end

  class Lines
    include Enumerable

    LINE_PARTS =
      ['the malt that lay in ',
       'the rat that ate ',
       'the cat that killed ',
       'the dog that worried ',
       'the cow with the crumpled horn that tossed ',
       'the maiden all forlorn that milked the ',
       'the man all tattered and torn that kissed ',
       'the priest all shaven and shorn that married the ',
       'the rooster that crowed in the morn that woke ',
       'the farmer sowing his corn that kept ',
       'the horse and the hound and the horn that belonged to ']

    def phrase(index: )
      LINE_PARTS.first(index)
        .reverse.join('')
    end
    
    def each(&block)
      i = 0

      LINE_PARTS.each_with_index do |part, index|
        yield phrase(index: i)
        i += 1
      end

      ["This is #{phrase(index: 0)}the house that Jack built.\n",
       "This is #{phrase(index: 1)}the house that Jack built.\n",
       "This is #{phrase(index: 2)}the house that Jack built.\n",
       "This is #{phrase(index: 3)}the house that Jack built.\n",
       "This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n",
       "This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n",
       "This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n",
       "This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n",
       "This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n",
       "This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n",
       "This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n",
       "This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
      ].to_enum(&block)
    end

    def to_a
      each.to_a
    end
  end
end
