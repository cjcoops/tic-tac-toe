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

  def claim(row, column)
    board.mark(row, column, current_player_mark)
    check_if_winner
  end

  def turn
    @turn ||= playerX
  end

  def check_if_winner
    if board.isWinner?
      puts "#{turn} wins"
    else
      switch_turns
    end
  end

  private

  def switch_turns
    turn == playerX ? self.turn = playerO : self.turn = playerX
  end

  def current_player_mark
    turn.mark
  end

end
