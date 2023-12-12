# General board class
class Board
    include Functions
    
    # Array of arrays to store the pieces of the games
    attr_reader :canvas    

    # Initialize a board gien two integers (size)
    def initialize(rows, columns)
        @canvas = Array.new(rows) { Array.new(columns) }
        @columns = generate_columns()
    end
    
    # Print a friendly reperesenation of the canvas for the user
    def show
        # Print the header section
        print "    "
        @columns.each { |c| print "#{c}   " }
        puts ""
        print "  "
        @columns.each { print "----" }
        print "-\n"
        
        # Print the body section
        i = @canvas.length 
        @canvas.each do |row|
            print "#{i} | "
            row.each do |element|
                cell = element ? element.mark : " "
                print "#{cell} | "
            end
            print "\n  "
            @columns.each { print "----" }
            print "-\n"
	    i -= 1
        end
    end
    
    # Check for a valid general coordinates
    def valid_coordinates?(row,col)
        # Convert the col value to downcase
        col = col.downcase()

        return false if row > @canvas.length
        return false if row < 1
        return false if !@columns.find_index(col)
        return true
    end
    
    # Gen the length of the canvas from board object
    def length
       return @canvas.length
    end
    
    # Check if the cell of a canvas given a row and col is empty
    def empty_cell?(row,col)
        return false if @canvas[row][col] != nil
        true    
    end
    
    # Add a piece to canvas
    def add(object,row,col)
        @canvas[row][col] = object
        return true
    end
    
    private
    
    # Array of letters for the Y axis
    attr_reader :columns
    
    # Generate an array of alphabet of the size of columns
    def generate_columns()
        alp = ("a".."z").to_a
        return alp[0,@canvas[0].length]
    end
   
end
