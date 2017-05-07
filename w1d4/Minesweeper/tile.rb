require "colorize"

class Tile
  attr_accessor :value, :bomb, :flag

  def initialize(value)
    @value = value
    @bomb = false
    @flag = false
  end

  def bombed?
    value = "b"
  end

  def flagged?
    value = :F
  end

  def revealed?
    value = :_
  end


  def reveal
  end

  def neighbors
  end

  def neighbor_bomb_count
  end

end
