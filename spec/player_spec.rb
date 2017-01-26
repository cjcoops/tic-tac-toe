require 'player'

describe Player do

  let(:playerX) {described_class.new(mark: :X)}
  let(:playerO) {described_class.new(mark: :O)}

  it "has a type" do
    expect(playerX.mark).to equal(:X)
    expect(playerO.mark).to equal(:O)
  end


end
