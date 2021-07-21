require_relative 'board_cell'

class Board 
  attr_accessor :board_array

  def initialize(size)
    @board_array = []

    for i in 1..size**2
      @board_array.push(BoardCell.new(" "))
    end

  end
end

