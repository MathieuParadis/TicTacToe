class Game
  @@number_of_games_played = 0
  @@numbers_of_draws = 0
  @@numbers_of_win_p1 = 0
  @@numbers_of_win_p2 = 0

  attr_reader :round
  attr_accessor :board

  def initialize(player1, player2)
    @round = 0
    @@number_of_games_played += 1

    @board = Board.new(3)
    @player1 = player1
    @player2 = player2

  end

  def self.number_of_games
    system "clear"
    puts ("-" * 121).colorize(:cyan).bold
    print "|".colorize(:cyan).bold," " * 55, "STATISTICS".colorize(:green).bold," " * 55,   "|".colorize(:cyan).bold, "\n"
    puts ("-" * 121).colorize(:cyan).bold
    print "\n"
    puts "Numbers of games played:       #{@@number_of_games_played.to_s.colorize(:blue).bold}"
    puts "Numbers of win for player1:    #{@@numbers_of_win_p1.to_s.colorize(:blue).bold}"
    puts "Numbers of win for player2:    #{@@numbers_of_win_p2.to_s.colorize(:blue).bold}"
    puts "Numbers of draw:               #{@@numbers_of_draws.to_s.colorize(:blue).bold}"

    print "\n"
    puts "To go back to the main menu, press any key"
    gets.chomp

  end
  
  def request_positions
    @round += 1
    round.odd? ? player = @player1 : player = @player2

    print "\n"
    puts "Indicate the position you wanna play"
    print "> "
    position = gets.chomp

      #Cases cell is empty
      if position == "A1" && @board.board_array[0].board_cell == " " then @board.board_array[0] = BoardCell.new(player.pattern)
      elsif position == "B1" && @board.board_array[1].board_cell == " " then @board.board_array[1] = BoardCell.new(player.pattern)
      elsif position == "C1" && @board.board_array[2].board_cell == " " then @board.board_array[2] = BoardCell.new(player.pattern)
      elsif position == "A2" && @board.board_array[3].board_cell == " " then @board.board_array[3] = BoardCell.new(player.pattern)
      elsif position == "B2" && @board.board_array[4].board_cell == " " then @board.board_array[4] = BoardCell.new(player.pattern)
      elsif position == "C2" && @board.board_array[5].board_cell == " " then @board.board_array[5] = BoardCell.new(player.pattern)
      elsif position == "A3" && @board.board_array[6].board_cell == " " then @board.board_array[6] = BoardCell.new(player.pattern)
      elsif position == "B3" && @board.board_array[7].board_cell == " " then @board.board_array[7] = BoardCell.new(player.pattern)
      elsif position == "C3" && @board.board_array[8].board_cell == " " then @board.board_array[8] = BoardCell.new(player.pattern)
      
        #Cases cell is not empty or input is wrong
      else 
        print "\n"
        puts "Sorry this cell is occupied, or does not correspond to our game"
    end

  end

  def is_there_a_winner?
    #Horizontal cases
    if @board.board_array[0].board_cell == @board.board_array[1].board_cell && @board.board_array[0].board_cell == @board.board_array[2].board_cell && @board.board_array[0].board_cell != " " then true
    elsif @board.board_array[3].board_cell == @board.board_array[4].board_cell && @board.board_array[3].board_cell == @board.board_array[5].board_cell && @board.board_array[3].board_cell != " " then true
    elsif @board.board_array[6].board_cell == @board.board_array[7].board_cell && @board.board_array[6].board_cell == @board.board_array[8].board_cell && @board.board_array[6].board_cell != " " then true

    # #Vertical cases
    elsif @board.board_array[0].board_cell == @board.board_array[3].board_cell && @board.board_array[0].board_cell == @board.board_array[6].board_cell && @board.board_array[0].board_cell != " " then true    
    elsif @board.board_array[1].board_cell == @board.board_array[4].board_cell && @board.board_array[1].board_cell == @board.board_array[7].board_cell && @board.board_array[1].board_cell != " " then true   
    elsif @board.board_array[2].board_cell == @board.board_array[5].board_cell && @board.board_array[2].board_cell == @board.board_array[8].board_cell && @board.board_array[2].board_cell != " " then true    

    # Diagonal cases
    elsif @board.board_array[0].board_cell == @board.board_array[4].board_cell && @board.board_array[0].board_cell == @board.board_array[8].board_cell && @board.board_array[0].board_cell != " " then true    
    elsif @board.board_array[6].board_cell == @board.board_array[4].board_cell && @board.board_array[6].board_cell == @board.board_array[2].board_cell && @board.board_array[6].board_cell != " " then true    

    else false

    end
  end


  def is_it_a_draw?
    if is_there_a_winner? == false && @board.board_array.none? {|i| i.board_cell == " "} == true
      return true
  else
    return false
  end
end


  def end
    if is_there_a_winner? == true
      if round.odd? == true
        @@numbers_of_win_p1 += 1
        winner = @player1 
        loser = @player2 
      else
        @@numbers_of_win_p2 += 1
        winner = @player2 
        loser = @player1
      end

      puts "Congratulations #{winner.name}, you beat #{loser.name}"

    elsif is_it_a_draw? == true
      @@numbers_of_draws += 1
      puts "It is a draw"
    end
  end

end
