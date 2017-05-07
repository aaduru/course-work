require_relative "board"

class Game
  attr_reader :board, :bomb

  def initialize(board = Board.new)
    @board = board
    @bomb = false
  end

  def play
    board.populate_bombs

    until over?
      break if board.grid.flatten.count(:_) + 2 == board.grid.length
      board.display
      pos = prompt
      @bomb = board.check_bomb?(pos)
      board.change_value(pos) if @bomb == false
    end
    p "You have won" if @bomb = false
  end

  def prompt
    puts "Enter position:"
    gets.chomp.split(",").map(&:to_i)
  end

  def over?
    return true  if @bomb == true

  end

end

game = Game.new

game.play
