# frozen_string_literal: true

# Controls the game play
class Board
  attr_reader :board
  def initialize
    @board = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
  end

  def render
    puts " #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]}"
    puts '---+---+---'
    puts " #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]}"
    puts '---+---+---'
    puts " #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]}"
  end

  def add_piece(piece, coord)
    coord = coord.map { |c| c - 1 }
    @board[coord[1]][coord[0]] = piece if coordinates_valid?(coord)
  end

  def coordinates_valid?(coord)
    coordinates_available?(coord) if coordinates_in_range?(coord)
  end

  def coordinates_in_range?(coord)
    if coord[0] <= 3 && coord[1] <= 3
      true
    else
      puts 'Coordinates are out of range!'
    end
  end

  def coordinates_available?(coord)
    if @board[coord[0]][coord[1]] == ' '
      true
    else
      puts 'Position is already taken!'
    end
  end

  def winning_combination?(piece)
    winning_horizontal?(piece) ||
      winning_vertical?(piece) ||
      winning_horizontal?(piece)
  end

  def winning_diagonal?(piece)
    diagonals.any? do |diagonal|
      diagonal.all? { |cell| cell == piece }
    end
  end

  def winning_vertical?(piece)
    verticals.any? do |column|
      column.all? { |cell| cell == piece }
    end
  end

  def winning_horizontal?(piece)
    horizontals.any? do |row|
      row.all? { |cell| cell == piece }
    end
  end

  def diagonals
    diagonals = []
    diagonals << [@board[0][0], @board[1][1], @board[2][2]]
    diagonals << [@board[0][2], @board[1][1], @board[2][0]]
    diagonals
  end

  def verticals
    verticals = []
    3.times do |i|
      verticals << [@board[0][i], @board[1][i], @board[2][i]]
    end
    verticals
  end

  def horizontals
    @board
  end

  def full?
    @board.all? do |row|
      row.all? do |cell|
        cell != ' '
      end
    end
  end
end

b = Board.new
puts b.coordinates_valid?([1,1])
puts b.coordinates_valid?([1,2])
puts b.coordinates_valid?([1,2])
puts b.coordinates_valid?([2,1])
puts b.coordinates_valid?([2,2])
puts b.coordinates_valid?([2,3])
puts b.coordinates_valid?([3,1])
puts b.coordinates_valid?([3,2])
puts b.coordinates_valid?([3,3])



