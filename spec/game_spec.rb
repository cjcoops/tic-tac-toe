require 'game'

describe Game do

  subject(:game) {described_class.new}

  it "has 2 players" do
    expect(game).to respond_to(:playerX)
    expect(game).to respond_to(:playerO)
  end

  it "playerO goes first" do
    expect(game.turn).to equal(game.playerX)
  end




end
