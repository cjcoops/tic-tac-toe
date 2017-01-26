# responsible for knowing what is on the game board

class Board

  attr_reader :grid

  def initialize(grid: nil)
    @grid = grid || Array.new(3) {Array.new(3)}
  end

  def mark(row, column, type)
    return if grid[row][column]
    grid[row][column] = type
  end

  def isComplete?
    return true if whole_column?
    false
  end

  private

  def whole_column?
    (0...grid.length).any? do |column|
      fields = [grid[0][column], grid[1][column], grid[2][column]]
      fields.compact.length == 3 && fields.uniq.length == 1
    end
  end

end
