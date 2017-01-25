class House
  PHRASES =
    ['the house that Jack built',
     'the malt that lay in',
     'the rat that ate',
     'the cat that killed',
     'the dog that worried',
     'the cow with the crumpled horn that tossed',
     'the maiden all forlorn that milked',
     'the man all tattered and torn that kissed',
     'the priest all shaven and shorn that married',
     'the rooster that crowed in the morn that woke',
     'the farmer sowing his corn that kept',
     'the horse and the hound and the horn that belonged to'].freeze

  def initialize(phrases: PHRASES)
    @phrases = phrases
  end

  def line(num)
    "This is #{phrases(num: num)}.\n"
  end

  def phrases(num: 12)
    @phrases.take(num)
      .reverse.join(' ')
  end
  
  def recite
    1.upto(12).collect { |i| line(i) }.join("\n")
  end
end
