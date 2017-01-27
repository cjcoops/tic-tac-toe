require 'game'

describe Game do

  let(:board) {double :board, mark: true, isWinner?: false, isDraw?: false}
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
      game.claim(0,0)
      expect(board).to receive(:mark).with(0,1,:O)
      game.claim(0,1)
    end

    it "switches the turn" do
      game.claim(0,0)
      expect(game.turn).to equal(playerO)
    end

    it "confirms the next player's turn" do
      expect(game.claim(0,0)).to eq("Player O's turn")
    end

    it "asks the board whether there is a winner" do
      expect(board).to receive(:isWinner?)
      game.claim(0,1)
    end

    it "asks the board whether there is a winner" do
      expect(board).to receive(:isDraw?)
      game.claim(0,1)
    end

    it "raises an error when player tries to claim field which is already taken" do
      allow(board).to receive(:mark).and_return(false)
      expect{game.claim(0,0)}.to raise_error("Try again, Player X's turn")
    end


    context "game is over" do

      it "raises an error if the game is already won" do
        allow(board).to receive(:isWinner?).and_return(true)
        expect{game.claim(0,0)}.to raise_error("The game is already over")
      end

      it "raises an error if the game is already a draw" do
        allow(board).to receive(:isDraw?).and_return(true)
        expect{game.claim(0,0)}.to raise_error("The game is already over")
      end

    end

  end

  describe "#check_if_over_or_switch_turns" do

    it "confirms that the current player is the winner if claim wins the game" do
      allow(board).to receive(:isWinner?) {true}
      expect(game.check_if_over_or_switch_turns).to eq("Player X wins")
    end

    it "confirms that the game is a draw claim draws the game" do
      allow(board).to receive(:isDraw?) {true}
      expect(game.check_if_over_or_switch_turns).to eq("It's a draw")
    end

  end

end
