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
    # grid.each do |row|
    #   row[0]
    # # end
    [grid[0][0], grid[1][0], grid[2][0]].compact.length == 3 && [grid[0][0], grid[1][0], grid[2][0]].uniq.length == 1
  end

end
