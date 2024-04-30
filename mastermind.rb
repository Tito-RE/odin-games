require_relative "functions.rb"
require_relative "board.rb"
require_relative "piece.rb"
require_relative "player.rb"

# Game "Mastermind" class
class MastermindGame

    # Initialize game "Mastermind"
    def initialize()
    	@secret_code_length = 4
    	@total_turns = 12
        @board = Board.new(12,@secret_code_length*2)
        @name = "Mastermind"
        @secret_code_colors = ['W','R','B','Y','G','P']
        @current_player_id = 1
        @players = [Player.new(self,"CodeMaker"),Player.new(self,"CodeBreaker")]
        print_game_message()
    end
    
    # Show the "white" and "red" feedback pieces
    def print_game_message()
        puts "0 => Color found in secret code"
        puts "@ => Color match with secret code"
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
    
    # Print the colors with and index 
    def print_colors()
        @secret_code_colors.each_with_index { |val, index| 
            puts "#{index+1}. #{val}"
        }
    end
    
    # Ask for one color from the codebreaker
    def ask_player_color()
        
        option = nil # Flag to store the "color" selected by the codebreaker
        
        # Get and validate the "color" of the codebraker
        loop do
            print_colors()
            puts "Codebraker select your color: (number)"
            option = gets.chomp.to_i
            break if (1..@secret_code_colors.length).to_a.include?(option)
            puts "Invalid option.."
        end
        
        return @secret_code_colors[option-1]
    end
    
    # Return the current player
    def current_player()
        return @players[@current_player_id]
    end
    
    # Place a piece from the player in the board with fixed x and y position
    def place_player_marker(player, piece, row, column)
        coordinates = convert_position(row, column)
        @board.add(piece,coordinates[0],coordinates[1])
    end
    
    # Convert positions to a valid positions
    def convert_position(row, column)
    
	# Convert row to internal index row to place in board
        row = @total_turns - row
        return row, column
    end
    
    # Check the user code vs the secret code
    def check_combination(row,col,current_combination)
        
        local_secret_code = @secret_code
        # local_secret_code = ['P','G','B','G'] # Testing
        
        # Convert the current object-array code to array  
        local_current_combination = []
        current_combination.each_with_index do |color, index|
            local_current_combination << color.mark
        end
        
        # Column where initialy assign the feedback
        index_feedback = col + 1
        
        # Check for the same color in the same index
        local_current_combination.each_with_index do |color, index|
            if color == local_secret_code[index] 
                # Assign a "flag" for the codes
                local_secret_code[index] = "@"
                local_current_combination[index] = "@"
                
                # Create a piece for the feedback
                piece = Piece.new(current_player(),"@","@")
                place_player_marker(current_player(), piece,  row, index_feedback)
                
                index_feedback += 1
            end
        end

	# Check for colors present in both codes (without order)
	local_current_combination.each_with_index do |color, index|
	    # Ignore the previous "flag"
	    if color != "@" 
                x = local_secret_code.find_index(color)
                # Color found in secret code
                if x
                    # Assign a "flag" for the codes
                    local_secret_code[x] = "@"
                    local_current_combination[index] = "@"
                    
                    # Create a piece for the feedback
                    piece = Piece.new(current_player(),"0","0")
                    place_player_marker(current_player(), piece,  row, index_feedback)
                    
                    index_feedback += 1
		end
            end
	end 
    end
    
    def game
        # Generate the secret code
        @secret_code = generate_random_secret_code()
    
        # Print the board at the beginning of the game
	@board.show()
	
	# Loop game
	for i in 1..@total_turns do
	    for j in 1..@secret_code_length do
	    
	        # Ask for color to codebreaker
	        color = ask_player_color()
	        
	        # Create the piece
	        piece = Piece.new(current_player(),color,color)
	        
	        # Place the color
	        place_player_marker(current_player(), piece,  i, j-1)
	        
	        # Show info to the user
	        @board.show()
	        print_game_message()
	      
	    end
	    
	    # Check the user code vs the secret code and do the feedback
	    check_combination(i, j-1, @board.canvas[11][0,@secret_code_length])
	    
	    # Show info to the user
	    @board.show()
	    print_game_message()
	    
	end
    end
    
end
