require_relative "functions.rb"
require_relative "board.rb"
require_relative "piece.rb"
require_relative "player.rb"

# Game "Mastermind" class
class MastermindGame
    # Initialize game "Mastermind"
    def initialize()
        @board = Board.new(12,8)
        @name = "Mastermind"
    end
    
    # Principal flow of the game
    def game 
        # Print the board at the beginning of the game
	@board.show()
    end
end
