# tictactoe.rb
# A simple tic-tac-toe game
#
# Draw a board
# loop until a winner or all squares are taken
#   player 1 chooses an empty square
#   check for a winner
#   computer 2 chooses an empty square
#   check for a winner
# 
# if there's a winner
#   show the winner
# or else
#   it's a tie

def initialize_board(b)
  b = {}
  (1..9).select {|position| b[position] = ' '}
  b
end

def draw_board(b)
  system 'clear'
  puts " #{b[1]} | #{b[2]} | #{b[3]} "
  puts "-----------"
  puts " #{b[4]} | #{b[5]} | #{b[6]} "
  puts "-----------"
  puts " #{b[7]} | #{b[8]} | #{b[9]} " 
end

def empty_positions(b)
  b.select {|k, v| v == ' ' }.keys
end

def player_picks_square(b)
  puts "Pick a square (1-9): "
  position = gets.chomp.to_i
  b[position] = 'X'
end

def computer_picks_square(b)
  position = empty_positions(b).sample
  b[position] = 'O'
end

def check_winner(b)
  winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  winning_lines.each do |line|
    if b[line[0]] == 'X' && b[line[1]] == 'X' && b[line[3]] == 'X'
      return 'Player'
    elsif b[line[0]] == 'O' && b[line[1]] == 'O' && b[line[3]] == 'O'
      return 'Computer'
    else
      return nil
    end
  end
end

board = initialize_board(board)
draw_board(board)

begin
  player_picks_square(board)
  computer_picks_square(board)
  draw_board(board)
  winner = check_winner(board)
end until winner || empty_positions(board).empty?
 
if winner
  "#{winner} won! "
else
  puts "It's a tie. "
end
