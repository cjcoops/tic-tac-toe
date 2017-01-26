require 'board'

describe Board do

  let(:board) {described_class.new}

  it "has a grid" do
    grid = [ [nil,nil,nil], [nil,nil,nil], [nil,nil,nil] ]
    expect(board.grid).to eq(grid)
  end

end
