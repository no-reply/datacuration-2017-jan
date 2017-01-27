##
# Sings a song in the form of 99 Bottles of Beer.
#
# @example singing the whole song
#   Bottles.new.song
#
# @example singing a range of verses
#   Bottles.new.verses(99, 22)
#
# @example singing a single verse
#   Bottles.new.verse(22)
#
# @see https://en.wikipedia.org/wiki/99_Bottles_of_Beer
class Bottles
  ##
  # Sings the song.
  #
  # @return [String] the whole song
  def song
    verses(99, 0)
  end

  ##
  # Gives the verse by number.
  #
  # @param number [Integer]
  # @return [String] the verse
  #
  # @todo fix this garbage
  def verse(number)
    bottle_number = BottleNumber.for(number: number)

    "#{bottle_number} of beer on the wall, ".capitalize +
    "#{bottle_number} of beer.\n" \
    "#{bottle_number.action}, "\
    "#{bottle_number.successor} of beer on the wall.\n"
  end

  ##
  # Gives the verses for a given range.
  #
  # @param upper [Integer] the verse to begin with
  # @param lower [Integer] the verse to end on
  # @return [String] the verses
  def verses(upper, lower)
    upper.downto(lower)
      .map { |i| verse(i) }
      .join("\n")
  end
end

##
# A number of "bottles" in a _99 Bottles_-like song.
#
# @example using the bottle number factory
#   bottle_1  = BottleNumber.for(number: 1)
#   bottle_99 = BottleNumber.for(number: 99)
#
# @example working with bottle numbers
#   bottle_num = BottleNumber.for(number: 99)
#
#   bottle_num.container # => 'bottles'
#   bottle_num.pronoun   # => 'one'
#   bottle_num.quantity  # => '99'
#   bottle_num.action    # => 'Take one down and pass it around'
#   bottle_num.successor # => 98
#
# @see Bottles
class BottleNumber
  ##
  # @!attribute [r] number
  #   @return [Integer]
  attr_reader :number

  ##
  # @param number [Integer]
  def initialize(number)
    @number = number
  end

  ##
  # @param number [Integer]
  # @return [BottleNumber] a BottleNumber instance for the number given
  def self.for(number: )
    case number
    when 0
      BottleNumber0
    when 1
      BottleNumber1
    when 6
      BottleNumber6
    else
      self
    end.new(number)    
  end

  ##
  # @return [String]
  def action
    "Take #{pronoun} down and pass it around"
  end

  ##
  # @return [String]
  def container
    'bottles'
  end

  ##
  # @return [String]
  def pronoun
    'one'
  end

  ##
  # @return [String]
  def quantity
    number
  end

  ##
  # Give the next bottle number.
  #
  # @note The bottle number normally decrements; so successor numbers are 
  #   usually the next lower number (`Integer#pred`). At the end of the song, 
  #   the number loops back to the beginning (as in "One more bottle of beer on
  #   the wall... Take it down pass it around, 99 bottles of beer on the wall").
  #
  # @return [Integer] the number for next bottle
  def successor
    BottleNumber.for(number: number - 1)
  end
  alias :succ :successor

  ##
  # @return [Integer]
  #
  # @see Integer#to_int
  def to_int
    number.to_int
  end

  ##
  # @!method to_i()
  #   @see Integer#to_i
  alias :to_i :to_int
  
  ##
  # @return [String]
  def to_s
    "#{quantity} #{container}"
  end
end

class BottleNumber0 < BottleNumber
  ##
  # @return [String]
  def action
    'Go to the store and buy some more'
  end

  ##
  # @return [String]
  def quantity
    'no more'
  end

  ##
  # @see BottleNumber#successor
  def successor
    BottleNumber.for(number: 99)
  end
  alias :succ :successor
end

class BottleNumber1 < BottleNumber
  ##
  # @return [String]
  def container
    'bottle'
  end

  ##
  # @return [String]
  def pronoun
    'it'
  end
end

class BottleNumber6 < BottleNumber
  ##
  # @return [String]
  def container
    'six-pack'
  end

  ##
  # @return [String]
  def quantity
    '1'
  end
end
