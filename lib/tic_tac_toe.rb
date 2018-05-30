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

def move(board, position, player)
  board[position] = player
  return board
end

def valid_move?(board, index)
  if position_taken?(board, index) == false && on_board(index) == true
    return true 
  else 
    return false
  end
end

def position_taken?(board, position)
  if board[position] == " " || board[position] == "" || board[position] == nil
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

def turn_count(board)
  turns = 0
  board.each do |space|
    if space == "X" || space == "O"
      turns += 1 
    end
  end
  return turns
end
  
  
def current_player(board)
    turns = turn_count(board)
    if turns % 2 == 0 
      return "X"
    else 
      return "O"
    end
end

def won?(board)
  WIN_COMBINATIONS.each {|win_combination|
    win_index_0 = win_combination[0]
    win_index_1 = win_combination[1]
    win_index_2 = win_combination[2]
    
    position_1 = board[win_index_0]
    position_2 = board[win_index_1]
    position_3 = board[win_index_2]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  }
  return false
end


def full?(board)
  board.all? {|index| index == "X" || index == "O"}
end  


def draw?(board)
  if won?(board) == false && full?(board) == true 
    return true
  else 
    return false
  end
end


def over?(board) 
  if won?(board) || draw?(board) == true || full?(board) == true 
    return true 
  elsif 
    
  else 
    return false
  end
end

def winner(board) 
  winning_combo = []
  winning_combo = won?(board)
  if winning_combo == false
    return nil
  else 
    if board[winning_combo[0]] == "X"
      return "X"
    else 
      return "O"
    end
  end
end

def play(board)
  until over?(board) == true
    turn(board)
    
  end
