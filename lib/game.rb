# responsible for controlling the flow of the game

require_relative "player"
require_relative "board"

class Game

  attr_reader :playerX, :playerO, :board
  attr_accessor :turn

  def initialize(playerX: nil, playerO: nil, board: nil)
    @playerX = playerX || Player.new(mark: :X)
    @playerO = playerO || Player.new(mark: :O)
    @board = board || Board.new
  end

  def mark(row, column)
    board.mark(row, column, current_player_mark)
    switch_turns
  end

  def turn
    @turn ||= playerX
  end

  private

  def switch_turns
    turn == playerX ? self.turn = playerO : self.turn = playerX
  end

  def current_player_mark
    turn.mark
  end

end
