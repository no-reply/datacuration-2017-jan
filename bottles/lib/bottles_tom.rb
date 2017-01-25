##
# Sings the bottles song.
class Bottles
  ##
  # @param count [Integer]
  # @return [String] the verse for a given number
  def verse(count)
    Verse.new(count)
  end

  class Verse
    def initialize(count)
      @count = count
    end
    
    ##
    # @return [String]
    def to_str
      build(count)
    end
    
    private

    def build(count)
      case count
      when 2
        "#{count} bottles of beer on the wall, " +
          "#{count} bottles of beer.\n" +
          "Take one down and pass it around, " +
          "#{count - 1} bottle of beer on the wall.\n"
      when 1
        "#{count} bottles of beer on the wall, " +
          "#{count} bottles of beer.\n" +
          "Take one down and pass it around, " +
          "#{count - 1} bottles of beer on the wall.\n"
      when 0
        "1 bottle of beer on the wall, " +
          "1 bottle of beer.\n" +
          "Take one down and pass it around, " +
          "no more bottles of beer on the wall.\n"
      else
        "No more bottles of beer on the wall, " +
          "no more bottles of beer.\n" +
          "Go to the store and buy some more, " +
          "99 bottles of beer on the wall.\n"
      end
    end
  end
end
