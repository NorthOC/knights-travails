require_relative './knight.rb'

#Board class to specify the size of the board and movements in Board environment
class Board
	def initialize(board_size = 8)
        @board_size = board_size
    end

#movement of Knight class
    def knight_moves(start_position, end_position, board_size = @board_size)
        queue = []
        current = Knight.new(start_position, nil, board_size)
        until current.position == end_position
            current.possible_moves.each {|child| queue.push(child)}
            current = queue.shift
        end
        display_move_path(current)
    end

#display movement and the number of moves
    def display_move_path(child, count = 0)
        p "It took #{count} moves to reach your goal" unless !child.parent.nil?
        display_move_path(child.parent, count + 1) unless child.parent.nil?
        p child.position
    end
    
end
