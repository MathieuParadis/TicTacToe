class BoardCell
  attr_accessor :board_cell

  def initialize(content)
    a = [" ", "X".colorize(:red).bold, "O".colorize(:yellow).bold]
    
    if a.include?(content) 
      @board_cell = "#{content}" 
    else
      puts "Something is wrong"
    end

  end
end

