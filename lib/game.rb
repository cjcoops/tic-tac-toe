require_relative "player"

class Game

  attr_reader :playerX, :playerO, :turn

  def initialize(player: Player)
    @playerX = Player.new(mark: :X)
    @playerO = Player.new(mark: :O)
    @turn = playerX
  end

end
