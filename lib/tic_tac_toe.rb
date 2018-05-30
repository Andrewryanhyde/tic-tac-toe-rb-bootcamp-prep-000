WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8], 
  [0,4,8],
  [6,4,2],
  ]

 def display_board(board)
separator = "|"
lines = "-----------"

puts " #{board[0]} #{separator} #{board[1]} #{separator} #{board[2]} "
puts "#{lines}"
puts " #{board[3]} #{separator} #{board[4]} #{separator} #{board[5]} "
puts "#{lines}"
puts " #{board[6]} #{separator} #{board[7]} #{separator} #{board[8]} "
end


def input_to_index(input)
number = input.to_i
position = number - 1
end

def move(board, position, player = "X")
  board[position] = player
  return board
end

def valid_move?(board, index)
  if position_taken(board, index) == false && on_board(index) == true
    return true 
  else 
    return false
  end
end

def position_taken(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  else
    return true
  end
end

def on_board(int)
    if int.between?(0,8) == true
      return true
    else 
      return false
    end
end


def turn(board) 
  puts "Please enter 1-9:"
  position = gets.strip
  index = input_to_index(position)
  if valid_move?(board, index) == true 
    move(board, index, player = "X")
    display_board(board)
  else
    until valid_move?(board, index) == true
    puts "Please enter 1-9:"
    position = gets.strip 
    index = input_to_index(position)
    valid_move?(board, index)
    end
  end
end


