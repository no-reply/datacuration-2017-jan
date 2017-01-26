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
#   Bottles.new.verses(22)
#
# @see https://en.wikipedia.org/wiki/99_Bottles_of_Beer
class Bottles
  ##
  # @param number [Integer]
  # @return [String]
  def action(number: )
    return 'Go to the store and buy some more' if number == 0
    "Take #{pronoun(number: number)} down and pass it around"
  end

  ##
  # @param number [Integer]
  # @return [String]
  def container(number: )
    return 'bottle' if number == 1
    'bottles'
  end

  ##
  # @param number [Integer]
  # @return [String]
  def pronoun(number: )
    return 'it' if number == 1
    'one'
  end
  
  ##
  # @param number [Integer]
  # @return [String]
  def quantity(number: )
    return 'no more' if number == 0
    number.to_s
  end

  ##
  # Sings the song.
  #
  # @return [String] the whole song
  def song
    verses(99, 0)
  end

  ##
  # @param number [Integer]
  # @return [Integer]
  def successor(number: number)
    return 99 if number == 0
    number-1
  end

  ##
  # @param number [Integer]
  # @return [String]
  def verse(number)
    "#{quantity(number: number).capitalize} #{container(number: number)} of beer on the wall, #{quantity(number: number)} #{container(number: number)} of beer.\n#{action(number: number)}, #{quantity(number: successor(number: number))} #{container(number: successor(number: number))} of beer on the wall.\n"
  end

  ##
  # Gives the verses for a given range.
  #
  # @param upper [Integer] the verse to begin with
  # @param lower [Integer] the verse to end on
  # @return [String]
  def verses(upper, lower)
    upper.downto(lower).map { |i| verse(i) }.join("\n")
  end
end
