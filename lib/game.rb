# responsible for controlling the flow of the game

require_relative "player"
require_relative "board"

class Game

  attr_reader :playerX, :playerO, :board
  attr_accessor :turn

  def initialize(playerX: Player.new(mark: :X),
                  playerO: Player.new(mark: :O),
                   board: Board.new)
    @playerX = playerX
    @playerO = playerO
    @board = board
    @turn ||= playerX
  end

  def mark
    switch_turns
  end

  private

  def switch_turns
    turn == playerX ? self.turn = playerO : self.turn = playerX
  end

end
