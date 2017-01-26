require 'game'

describe Game do

  subject(:game) {described_class.new}

  it "has 2 players" do
    expect(game).to respond_to(:playerO)
    expect(game).to respond_to(:playerX)
  end

  # it "has 2 players" do
  #   expect(game.playerO)
  # end


end
