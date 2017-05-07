require_relative "tile"
require 'byebug'

class Board
  attr_reader :grid, :bombs

  def empty_grid
    Array.new(4) do
      Array.new(4) { Tile.new(:*) }
    end
  end

  def initialize(grid = empty_grid)
    @grid = grid
    @bombs = []
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    tile = grid[x][y]
    tile.value = value
  end

  def populate_bombs
    2.times do
       pos = get_random_pos
       tile = self[pos]
       tile.bomb = true
    end

  end

  def get_random_pos
    pos = [rand(grid.length),rand(grid.length)]
    until !@bombs.include?(pos)
      pos = [rand(grid.length),rand(grid.length)]
      bombs << pos
    end
    p pos
  end

  def display
    puts "     #{(0..3).to_a.join("   ")}"
    grid.each_with_index do |row , i|
      sub_arr = []
      row.each do |col|
        sub_arr << col.value
      end
      puts "#{i}  #{sub_arr}\n"
    end
  end

  def check_bomb?(pos)
    tile = self[pos]
    tile.bomb
  end

  def change_value(pos)
    tile = self[pos]
    tile.value = :_
  end
end

# game = Board.new
# game.display
# p game.populate_bombs
