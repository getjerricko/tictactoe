# tictactoe1.rb
# a simple tic-tac-toe game
# draw a board
# user picks an empty square
# pc picks an empty square
# check for winner or until
# all squares are taken

def initialize_board
  b = []
  9.times { b << ' ' }  
  b
end

def draw_board(b)
  system 'clear'
  puts " #{b[0]} | #{b[1]} |#{b[2]} "
  puts "-----------"
  puts " #{b[3]} | #{b[4]} |#{b[5]} "
  puts "-----------"
  puts " #{b[6]} | #{b[7]} |#{b[8]} "
end

def empty_sq(b)
  # return the indices that are empty
  b.each_index.select { |i| b[i] == ' '}
end

def user_pick_square(b)
  puts "Pick a square (1-9): "
  position = gets.chomp.to_i
  b[position - 1] = 'X'
end

def pc_pick_square(b)
  position = empty_sq(b).sample 
  b[position - 1] = 'O'
end

#def check_winner(b)
#  winning_lines = []
#  if
#  end
#end

board = initialize_board
draw_board(board)
begin
  user_pick_square(board)
  draw_board(board)
  pc_pick_square(board)
  draw_board(board)
  winner = check_winner(board)
end until winner || empty_sq(board).empty? 
# end until empty_sq(board).empty? 

#if winner
#  "#{winner} won! "
#else
#  "It's a tie. "
#end
