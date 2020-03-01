# frozen_string_literal: true

# Controls the game play
class TicTacToe
  require_relative '../tic_tac_toe/board'
  require_relative '../tic_tac_toe/player'

  attr_accessor :current_player

  def initialize
    @board = Board.new

    @player_x = Player.new('Player X', 'X', @board)
    @player_o = Player.new('Player O', 'O', @board)

    @current_player = @player_x
  end

  def play
    until game_over?
      @board.render
      @current_player.put_coordinates
      switch_player
    end
  end

  def game_over?
    check_victory || check_draw
  end

  def check_victory
    if @board.winning_combination?('X') || @board.winning_combination?('O')
      puts "#{@current_player.name} wins"
    end
    false
  end

  def check_draw
    if check_victory && @board.full?
      puts 'Draw'
    else
      false
    end
  end

  def switch_player
    @current_player = if @current_player == @player_x
                        @player_o
                      else
                        @player_x
                      end
  end
end

t = TicTacToe.new