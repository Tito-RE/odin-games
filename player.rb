# General player class
class Player
    # Name of the player
    attr_reader :name
    
    # Initialize a player
    def initialize(game,name)
        @game = game
        @name = name
    end

    # Ask for a valid coordinates from the board by xy style
    def select_position(piece)
        coordinates = nil
        
        # Get coordinates from players
        loop do
            puts "Player #{@name}"
            puts "Insert the row (number): "
            x = gets.chomp.to_i
            puts "Insert the column (letter): "
            y = gets.chomp
	
            coordinates = @game.convert_position(piece,x,y)
            
            break if !coordinates.nil?
        end
        return coordinates
    end
    
    #Ask for a valid choice from user
    #def select_piece(piece)
    #	coordinates = nil
    	
    	# Get coordinates from players
    #	loop do
     #       puts "Player #{@name}"
      #      puts "Select a color: "
       #     y = gets.chomp.to_i
        #    
         #   coordinate = @game.convert_position(piece,y)
        #    
       #     break if !coordinate.nil?
      #  end
     #   return coordinate
    #end
end
