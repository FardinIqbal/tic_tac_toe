# frozen_string_literal: true

# Manages all player related functionality
class Player
  require_relative '../tic_tac_toe/board'
  attr_accessor :piece, :name

  def initialize(name, piece, board)
    @name = name
    @piece = piece
    @board = board
  end

  def put_coordinates
    # adds the piece to the board
    coord = []
    loop do
      coord = ask_for_coordinates
      if validate_coordinates_format(coord)
        break if @board.add_piece(@piece, coord)
      end
    end
  end

  def ask_for_coordinates
    puts 'Please enter your coordinates'
    gets.strip.split(',').map(&:to_i)
  end

  def validate_coordinates_format(coord)
    # returns true is the format of the input is valid
    if coord.is_a?(Array) && coord.size == 2
      true
    else
      puts 'Your coordinates are not in proper format!'
    end
  end
end

