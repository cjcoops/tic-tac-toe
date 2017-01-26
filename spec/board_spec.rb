require 'board'

describe Board do

  let(:playerO) {double :playerX, mark: :O}
  let(:playerX) {double :playerX, mark: :X}
  let(:board) {described_class.new}

  it "has an empty grid on initialization" do
    grid = [ [nil,nil,nil], [nil,nil,nil], [nil,nil,nil] ]
    expect(board.grid).to eq(grid)
  end

  describe "#mark" do

    it "marks a field on the grid" do
      board.mark(0, 0, :X)
      expect(board.grid[0][0]).to equal(:X)
    end

    it "returns if field is already taken" do
      board.mark(0, 0, :X)
      board.mark(0, 0, :O)
      expect(board.grid[0][0]).to equal(:X)
    end

  end

  describe "#isComplete?" do

    it "returns false at the start" do
      expect(board.isComplete?).to equal(false)
    end

    it "returns true when a player has the whole left column" do
      board = Board.new(grid: [ [:X,nil,nil], [:X,nil,nil], [:X,nil,nil] ])
      expect(board.isComplete?).to equal(true)
    end

    it "returns true when a player has the whole middle column" do
      board = Board.new(grid: [ [nil,:O,nil], [nil,:O,nil], [nil,:O,nil] ])
      expect(board.isComplete?).to equal(true)
    end
  end

end
