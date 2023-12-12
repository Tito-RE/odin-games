# General piece class
class Piece

    # Initialize a piece
    def initialize(player, name, mark)
        @player = player
        @name = name
        @mark = mark
    end
    
    # Value or symbol to show to players
    attr_reader :mark
end 
