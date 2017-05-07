class Game
  attr_reader :player1, :player2, :current_player, :previous_player
  def initialize(player1, player2)
    @player1 = Player.new(player1)
    @player2 = Player.new(player2)
    @fragment = ""
    #txtfile = File.readlines("dictionary.txt")
    @dictionary = {}
    @current_player = @player1
    @previous_player = @player2
    @ghost_dictionary = []
  end

  def dict_assign
    txt = File.readlines("dictionary.txt")
    txt.each do |el|
      el = el[0...-1]
      @dictionary[el[0]] = (@dictionary[el[0]]||[]) << el

    end

  end

  def current_player
    @current_player
  end

  def previous_player
    @previous_player
  end

  def next_player!
    @current_player, @previous_player = @previous_player, @current_player
  end

  def update_ghost_dict
    if @fragment.length == 1
      @ghost_dictionary = @dictionary[@fragment]
    else
      @ghost_dictionary.select! do |el|
        el.slice(0...@fragment.length) == @fragment
      end
    end
  end

  def take_turn

    temp = @current_player.guess

    until valid_play?(temp)
      temp = @current_player.guess
      p temp
    end

p "frag #{@fragment}"
    next_player!

  end

  def valid_play?(string)
    temp = @fragment + string
    if temp.length == 1
      @fragment = temp
      p @fragment
      update_ghost_dict
      return true
    end
    p @ghost_dictionary
    @ghost_dictionary.each do |el|
      if el.include?(temp)
        @fragment = temp
        return true
      end
    end
    false
  end

  def game_end
    @ghost_dictionary.include?(@fragment)
  end


  def run
    dict_assign
    take_turn

    until game_end
      update_ghost_dict
      take_turn
      puts @fragment
    end

  end

end


class Player

  def initialize(name)
    @name = name
  end

  def guess
    puts " Enter the letter:"
    letter = gets.chomp
    until alert_invalid_guess(letter)
      puts "rrr"
      puts " Enter the letter:"
      letter = gets.chomp

    end
    letter
  end

  def alert_invalid_guess(string)
    "abcdefghijklmnopqrstuvwxyz".split("").include?(string.downcase)
  end

end

test = Game.new("happy", "test")
test.run
