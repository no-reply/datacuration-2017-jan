class Bottles
  def verse(count)
    "#{count} #{beverage_text(count)} of beer on the wall, " +
      "#{count} #{beverage_text(count)} of beer.\n" +
      "Take one down and pass it around, " +
      "#{count - 1} #{beverage_text(count - 1)} of beer on the wall.\n"
  end

  private
  
  def beverage_text(count)
    return "bottle" if count == 1
    "bottles"
  end
end
