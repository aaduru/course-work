#require_relative 'board'
require_relative 'tree_node'
require 'byebug'

class KnightPathFinder
  MOVES = [
    [-2, 1],
    [-2, -1],
    [-1, 2],
    [-1, -2],
    [1, 2],
    [1, -2],
    [2, 1],
    [2, -1]
  ]

  attr_reader :pos, :visited_positions, :starting_pos

  def initialize(starting_pos)
    @starting_pos = starting_pos
    @visited_positions = [@starting_pos]
    #@tree = build_move_tree
    @root = PolyTreeNode.new(starting_pos)
  end

  def valid_moves
    valid_moves = []
    MOVES.each do |move|
      first = (move.first + self.starting_pos.first)
      last = (move.last + self.starting_pos.last)
      if first.between?(0, 7) && last.between?(0, 7)
        valid_moves << [first, last]
      end
    end
    valid_moves
  end


  def new_move_positions
    new_moves = self.valid_moves
    # debugger
    @visited_positions.each {|v_pos| new_moves.delete(v_pos) }
    new_moves.each {|move| @visited_positions << move}
    new_moves
  end

  def build_move_tree
  #   this_pos = PolyTreeNode.new(self)
  #
  #   self.new_move_positions.each do |next_pos|
  #     next_pos = PolyTreeNode.new(next_pos)
  #     this_pos.add_child(next_pos)
  #   end
  # end

    # parent = PolyTreeNode.new(self)

    queue = [@root]

    until queue.empty?
      current_root = queue.shift
      #puts current_root.value
      children = KnightPathFinder.new(current_root.value).new_move_positions
      p children
      children.each do |child|
        child_node = PolyTreeNode.new(child)
        current_root.add_child(child_node)
        queue << child_node
        #puts queue
      end

    end

  end


  def find_path(end_pos)

  end

end

kpf = KnightPathFinder.new([0,0])
#kpf.new_move_positions
p kpf.build_move_tree
