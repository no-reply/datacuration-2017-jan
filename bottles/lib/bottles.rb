##
# Sings the bottles song.
#
# @example singing the song from 99 down to 0
#   Bottles.new.song
#
# @example singing a range of verses
#   Bottles.new.verses(99, 10)
#
# @example singing a single verse
#   Bottles.new.verse(99)
class Bottles

  ##
  # @return [String] the song
  def song
    verses(99, 0)
  end
  alias :to_s :song

  ##
  # @param count [Integer]
  #
  # @return [String] the verse for a given number
  def verse(count)
    Verse.new(count).to_s
  end

  ##
  # @param first [Integer]
  # @param last [Integer]
  #
  # @return [String]
  def verses(first, last)
    (last..first).to_a.reverse.map do |count| 
      Verse.new(count).to_s 
    end.join("\n")
  end

  ##
  # A verse in the song
  class Verse
    ## 
    # @param count [Integer]
    def initialize(count)
      @count = count
    end

    ##
    # @return [Verse] the next verse
    def next
      Verse.new(@count + 1)
    end

    ##
    # @return [Verse] the previous verse
    def prev
      Verse.new(@count - 1)
    end
    
    ##
    # @return [String]
    def to_str
      self.class.build(@count)
    end
    alias :to_s :to_str

    ##
    # @param count [Integer]
    #
    # @return [String] the built verse
    def self.build(count)
      case count
      when 2
        "#{count} bottles of beer on the wall, " +
          "#{count} bottles of beer.\n" +
          "Take one down and pass it around, " +
          "#{count - 1} bottle of beer on the wall.\n"
      when 1
        "1 bottle of beer on the wall, " +
          "1 bottle of beer.\n" +
          "Take it down and pass it around, " +
          "no more bottles of beer on the wall.\n"
      when 0
        "No more bottles of beer on the wall, " +
          "no more bottles of beer.\n" +
          "Go to the store and buy some more, " +
          "99 bottles of beer on the wall.\n"
      else
        "#{count} bottles of beer on the wall, " +
          "#{count} bottles of beer.\n" +
          "Take one down and pass it around, " +
          "#{count - 1} bottles of beer on the wall.\n"
      end
    end
  end
end
