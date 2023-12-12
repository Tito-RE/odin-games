# General functions to convert or interpret values from user to workable inputs
module Functions
    # Convert one letter to a number (alphabetically)
    def letter_to_number(letter)
        alp = ("a".."z").to_a
        return alp.index(letter)
    end

    # Invert the number given by a valid index from 0 to max
    def invert_number(max,number)
        inverted = (0..max-1).to_a.reverse
        return inverted[number-1]
    end
end 
