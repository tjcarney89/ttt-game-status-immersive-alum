# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return combo
    end
  end
  return false
end

def full?(board)
  board.all? { |space| space != " " }
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) != false
    winning_board_first = won?(board)[0]
    if board[winning_board_first] == "X"
      return "X"
    elsif board[winning_board_first] == "O"
      return "O"
    end
  else
    nil
  end
end

win_x = ["X", "X", "X", " ", " ", " ", " ", " ", " "]
win_o = ["O", "O", "O", " ", " ", " ", " ", " ", " "]
no_win = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
winner(win_x)
