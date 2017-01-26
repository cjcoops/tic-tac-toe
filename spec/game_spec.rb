require 'game'

describe Game do

  let(:board) {double :board}
  let(:playerO) {double :player}
  let(:playerX) {double :player}
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

  it "playerO goes next" do
    game.mark
    expect(game.turn).to equal(playerO)
  end

  describe "#mark" do

    it "switches the turn" do
      game.mark
      expect(game.turn).to equal(playerO)
    end

  end


end
