require_relative 'piece'

class Board
  
  def initialize
    @grid = Array.new(8) {Array.new(8) }  
    populate
  end
  
  
  attr_reader :grid
  
  def [](pos)
    row, col = pos
    grid[row][col]
  end
  
  def []=(pos, val)
    row,col = pos
    grid[row][col] = val
  end
  
  def populate
    grid.each_with_index do |row, i|
      if [0, 1, 6, 7].include?(i)
        row.each_index do |j|
          pos = [i,j]
          self[pos] = Piece.new
        end
      end
    end
    nil #return nil bc we want to return grid for user to see
  end
end