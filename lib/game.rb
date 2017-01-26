require_relative "player"

class Game

  attr_reader :playerX, :playerO
  attr_accessor :turn

  def initialize(player: Player)
    @playerX = Player.new(mark: :X)
    @playerO = Player.new(mark: :O)
    @turn ||= playerX
  end

  def mark
    switch_turns
  end

  private

  def switch_turns
    turn == playerX ? self.turn = playerO : self.turn = player1
  end

end
