def grid_maker
  board = []
  valid = Array.new(8) { Array.new(8) }
  valid.each_index do |i|
    valid[i].each_index do |j|
      valid[i][j] = [i, j]
      board.push([i, j])
    end
  end
  board
end

def valid(pos)
  board = grid_maker
  return true if board.include?(pos)

  false
end

def where_can_the_knight_go_from(pos)
  i = pos[0]
  j = pos[1]
  result = []
  result.push([i + 2, j + 1]) if valid([i + 2, j + 1])
  result.push([i + 1, j + 2]) if valid([i + 1, j + 2])
  result.push([i + 2, j - 1]) if valid([i + 2, j - 1])
  result.push([i + 1, j - 2]) if valid([i + 1, j - 2])
  result.push([i - 2, j + 1]) if valid([i - 2, j + 1])
  result.push([i - 1, j + 2]) if valid([i - 1, j + 2])
  result.push([i - 2, j - 1]) if valid([i - 2, j - 1])
  result.push([i - 1, j - 2]) if valid([i - 1, j - 2])
  result
end
