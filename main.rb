require_relative "ticTaeToe.rb"
require_relative "mastermind.rb"

option = nil

# Select the game  
loop do
  
  puts "Select a game:"
  puts "1. TicTaeToe"
  puts "2. Mastermind"
  option = gets.chomp.to_i
            
  break if [1,2].include?(option)
end

if option == 1
  game = TicTaeToeGame.new()
else
  game = MastermindGame.new()
end

# Run the game
game.game()
