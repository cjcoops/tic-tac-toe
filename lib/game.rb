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
    raise "The game is already over" if game_over?
    return check_if_over if board.mark(row, column, current_player_mark)
    raise "Try again, Player #{turn.mark}'s turn"
  end

  def turn
    @turn ||= playerX
  end

  def check_if_over
    return "Player #{turn.mark} wins" if board.isWinner?
    return "It's a draw" if board.isDraw?
    switch_turns
    puts "Player #{turn.mark}'s turn"
  end

  private

  def switch_turns
    turn == playerX ? self.turn = playerO : self.turn = playerX
  end

  def current_player_mark
    turn.mark
  end

  def game_over?
    board.isWinner? || board.isDraw?
  end

end
