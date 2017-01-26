require 'game'

describe Game do

  let(:board) {double :board, mark: nil, isWinner?: false}
  let(:playerO) {double :player, mark: :O}
  let(:playerX) {double :player, mark: :X}
  subject(:game) {described_class.new(playerX: playerX, playerO: playerO, board: board)}

  it "has 2 players" do
    expect(game).to respond_to(:playerX)
    expect(game).to respond_to(:playerO)
  end

  it "has a board" do
    expect(game).to respond_to(:board)
  end

  it "playerX goes first" do
    expect(game.turn).to equal(playerX)
  end

  describe "#claim" do

    it "instructs the board to mark a cell with the current players mark" do
      expect(board).to receive(:mark).with(0,0,:X)
      game.claim(0,0)
    end

    it "instructs the board to mark a cell with the next players mark after a switch" do
      allow(board).to receive(:mark).with(0,0,:X)
      game.claim(0,0)
      expect(board).to receive(:mark).with(0,1,:O)
      game.claim(0,1)
    end

    it "switches the turn" do
      game.claim(0,0)
      expect(game.turn).to equal(playerO)
    end

    it "asks the board whether there is a winner" do
      expect(board).to receive(:isWinner?)
      game.claim(0,1)
    end

  end

  describe "#isOver?" do

    # it "knows when the game is not over" do
    #   allow(board).to receive(:isWinner?).and_return(true)
    #   expect(game.isOver?).to equal(false)
    # end


    # it "knows when the game is not over" do
    #   allow(board).to receive(:isComplete?).and_return(false)
    #   expect(game.isOver?).to equal(false)
    # end
    #
    # it "knows when the game is over" do
    #   allow(board).to receive(:isComplete?).and_return(true)
    #   expect(game.isOver?).to equal(true)
    # end

  end


end
