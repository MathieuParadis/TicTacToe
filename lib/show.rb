require "colorize"

class Show

  def initialize(board_array)
    @board_array = board_array
  end

  def show_board
    separator = "|".bold
    size = Integer.sqrt(@board_array.length)
    j = 0

    print "\n"
  
    puts "  A B C"

    for i in 1..size
      print i, separator,@board_array[j].board_cell,separator,@board_array[j+1].board_cell,separator,@board_array[j+2].board_cell,separator
      print "\n"
      j += size
    end
    print "\n"

  end
   
  

end
