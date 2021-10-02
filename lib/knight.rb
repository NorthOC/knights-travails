
#knight chess piece class
class Knight
    attr_reader :position, :parent, :children
    @@tested = []

    def initialize(position, parent = nil, board_size = 8)
        @position = position
        @parent = parent
        @board_size = board_size
        @@tested << @position
    end

#calculates all the possible moves from current position and returns said moves
    def possible_moves
        moves = [[1, 2], [-2, -1], [-1, 2], [2, -1],
        [1, -2], [-2, 1], [-1, -2], [2, 1]]
        moves = moves.map {|value| [@position[0] + value[0], @position[1] + value[1]] }
        moves = moves.select {|move| move[0].between?(1, @board_size) && move[1].between?(1, @board_size)}
        moves = moves.select {|move| !@@tested.include?(move)}
        moves = moves.map {|move| Knight.new(move, self, @board_size)}
        return moves
    end
end