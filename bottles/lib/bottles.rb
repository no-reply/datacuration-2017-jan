##
# Sings a song that is structurally like 99 Bottles of Beer on the Wall. The 
# default implementation sings the basic version of the song.
#
# @todo open to six packs. When the number of bottles left is 6, we should say
#   "One six pack", instead of "6 bottles".
#
# @see https://en.wikipedia.org/wiki/99_Bottles_of_Beer
class Bottles
  ##
  # Gives the action that should be taken after declaring the {#quantity} of
  # "bottles" on the wall.
  #
  # @param number [Integer] the number of "bottles" on the wall
  # @return [String] a description of the action for this song.
  def action(number: )
    return 'Go to the store and buy some more' if number == 0
    "Take #{pronoun(number: number)} down and pass it around"
  end

  ##
  # @param number [Integer] the number of "bottles" on the wall
  # @return [String] the container text; form is sensitive to number
  def container(number: )
    return 'bottle' if number == 1
    'bottles'
  end

  ##
  # @param number [Integer] the number of "bottles" on the wall
  # @return [Integer] the number of "bottles" in the next verse
  def successor(number: )
    return 99 if number == 0
    number - 1
  end
  # @!method succ(number: )
  #   @see #successor
  alias :succ :successor

  ##
  # @param number [Integer] the number of "bottles" on the wall
  # @return [String] the number sensitive pronoun form for the "bottles"
  def pronoun(number: )
    return 'it' if number == 1
    'one'
  end

  ##
  # @param number [Integer] the number of proverbial bottles on the wall
  # @return [String] a description of the number of bottles on the wall
  def quantity(number: )
    return 'no more' if number == 0
    number.to_s
  end

  ##
  # Sings the song in whole.
  #
  # @return [String] 
  def song
    verses(99, 0)
  end

  ##
  # @param number [Integer] the verse number, representing the number of 
  #   "bottles"
  # @return [String] the text for the verse.
  def verse(number)
    "#{quantity(number: number).capitalize} #{container(number: number)} of beer on the wall, " \
    "#{quantity(number: number)} #{container(number: number)} of beer.\n" \
    "#{action(number: number)}, " \
    "#{quantity(number: successor(number: number))} #{container(number: successor(number: number))} of beer on the wall.\n"
  end

  ##
  # Gives a range of verses beginning with a starting verse `upper` and 
  #   completing with `lower`, each representing numbers of "bottles" on 
  #   "the wall" in the song form.
  #v
  # @param upper [Integer] the verse to start at.
  # @param lower [Integer] the verse to end with.
  #
  # @return [String] the text for the verse range given.
  def verses(upper, lower)
    upper.downto(lower).map { |i| verse(i) }.join("\n")
  end
end
