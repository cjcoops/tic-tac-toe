# responsible for knowing what is on the game board

class Board

  attr_reader :grid

  def initialize
    @grid = Array.new(3,Array.new(3))
  end

  def mark(row, column, type)
    grid[row][column] = type
  end

end
