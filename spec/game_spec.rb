require 'game'

describe Game do

  subject(:game) {described_class.new}

  it "has 2 players" do
    expect(game).to respond_to(:playerX)
    expect(game).to respond_to(:playerO)
  end

  it "playerX goes first" do
    expect(game.turn).to equal(game.playerX)
  end

  it "playerO goes next" do
    game.mark
    expect(game.turn).to equal(game.playerO)
  end

  describe "#mark" do

    it "switches the turn" do
      game.mark
      expect(game.turn).to equal(game.playerO)
    end

  end


end
