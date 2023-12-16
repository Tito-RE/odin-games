require_relative "functions.rb"
require_relative "board.rb"
require_relative "piece.rb"
require_relative "player.rb"

# Game "Mastermind" class
class MastermindGame

    # Initialize game "Mastermind"
    def initialize()
    	@secret_code_length = 4
    	
        @board = Board.new(12,@secret_code_length*2)
        @name = "Mastermind"
        @secret_code_colors = ['W','R','B','Y','G','P']
    end
    
    # Principal flow of the game
    def game
        @secret_code = generate_random_secret_code()
        show_secret_code()
    
        # Print the board at the beginning of the game
	@board.show()
    end
    
    # Generate the random secret code from the pc
    def generate_random_secret_code()
        secret_code = []
        for i in 1..@secret_code_length do
            index = rand(@secret_code_length)
            secret_code.append(@secret_code_colors[index])
        end
        return secret_code
    end
    
    # Show the secret code in user-friendly way
    def show_secret_code()
        print @secret_code
        puts ""
    end
end
