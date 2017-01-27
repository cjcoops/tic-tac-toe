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

    it "returns false if field is already taken" do
      board.mark(0, 0, :X)
      expect(board.mark(0, 0, :O)).to equal(false)
      expect(board.grid[0][0]).to equal(:X)
    end

  end

  describe "#isWinner?" do

    it "returns false at the start" do
      expect(board.isWinner?).to equal(false)
    end

    it "returns true when a player has the whole left column" do
      board = Board.new(grid: Array.new(3) {[:X,nil,nil]})
      expect(board.isWinner?).to equal(true)
    end

    it "returns true when a player has the whole middle column" do
      board = Board.new(grid: Array.new(3) { [nil,:O,nil]})
      expect(board.isWinner?).to equal(true)
    end

    it "returns true when a player has the whole right column" do
      board = Board.new(grid: Array.new(3) {[nil,nil,:O] })
      expect(board.isWinner?).to equal(true)
    end

    it "returns true when a player has the whole top row" do
      board = Board.new(grid: [ [:O,:O,:O], [nil,nil,nil], [nil,nil,nil] ])
      expect(board.isWinner?).to equal(true)
    end

    it "returns true when a player has the whole bottom row" do
      board = Board.new(grid: [ [nil,nil,nil], [nil,nil,nil],[:O,:O,:O] ])
      expect(board.isWinner?).to equal(true)
    end

    it "returns true when a player has the whole middle row" do
      board = Board.new(grid: [ [nil,nil,nil], [:O,:O,:O],[nil,nil,nil] ])
      expect(board.isWinner?).to equal(true)
    end

    it "returns true when a player has the \\ diagonal" do
      board = Board.new(grid: [ [:X,nil,nil], [nil,:X,nil],[nil,nil,:X] ])
      expect(board.isWinner?).to equal(true)
    end

    it "returns true when a player has the \/ diagonal" do
      board = Board.new(grid: [ [nil,nil,:O], [nil,:O,nil],[:O,nil,nil] ])
      expect(board.isWinner?).to equal(true)
    end

    it "returns true no 3 matching fields" do
      board = Board.new(grid: [ [:X,nil,:O], [nil,:O,:X],[:X,nil,:O] ])
      expect(board.isWinner?).to equal(false)
      board = Board.new(grid: [ [:X,:X,:O], [:O,:O,:X],[:X,nil,:O] ])
      expect(board.isWinner?).to equal(false)
      board = Board.new(grid: [ [:X,:O,:X], [nil,:X,:X],[:O,nil,:O] ])
      expect(board.isWinner?).to equal(false)
    end

  end

  describe "#isOver?" do

    it "return false if the game is still in play" do
      expect(board.isDraw?).to equal(false)
    end

    it "returns true if the game is a draw" do
      board = Board.new(grid: [ [:X,:X,:O], [:X,:O,:X],[:O,:O,:X] ])
      expect(board.isDraw?).to equal(true)
    end


  end

end
