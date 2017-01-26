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
    return true if whole_row?
    return true if right_diagonal?
    false
  end

  private

  def whole_column?
    (0...grid.length).any? do |column|
      fields = [grid[0][column], grid[1][column], grid[2][column]]
      fields_same_and_not_nil?(fields)
    end
  end

  def whole_row?
    grid.any? do |row|
      fields = [row[0], row[1], row[2]]
      fields_same_and_not_nil?(fields)
    end
  end

  def right_diagonal?
    fields = [grid[0][0], grid[1][1], grid[2][2]]
    fields_same_and_not_nil?(fields)
  end

  def fields_same_and_not_nil?(fields)
    fields.compact.length == 3 && fields.uniq.length == 1
  end

end
