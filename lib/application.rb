class Application

  def initialize
    system "clear"
    puts ("-" * 121).colorize(:cyan).bold
    print "|".colorize(:cyan).bold," " * 54, "TIC-TAC-TOE".colorize(:green).bold," " * 54,   "|".colorize(:cyan).bold, "\n"
    puts ("-" * 121).colorize(:cyan).bold
    print "\n"

    puts "Hello, Welcome on the #{"Tic-Tac-Toe".colorize(:green).bold} game!"
    print "\n"
    puts "Let's get started. #{"Player1".colorize(:red).bold}, What's your name?"
    print "> "
    input_player1 = gets.chomp.colorize(:red).bold
    print "\n"
    puts "Great. Well noted"
    print "\n"

    puts "#{"Player2".colorize(:yellow).bold}, your turn! What's your name?"
    print "> "
    input_player2 = gets.chomp.colorize(:yellow).bold
    print "\n"
    puts "Cool. let's move on"

    print "\n"
    puts "Press any key to continue"
    gets.chomp

    player1 = Player.new(input_player1)
    player2 = Player.new(input_player2)


    while main_menu == 1 do
      print "\n"
      puts "#{player1.name} will play with the pattern #{player1.pattern = "X".colorize(:red).bold}, and #{player2.name} will play with the pattern #{player2.pattern = "O".colorize(:yellow).bold}"
      gets.chomp

      game = Game.new(player1, player2)
      view = Show.new(game.board.board_array)


      round = 0

      while game.is_there_a_winner? == false && game.is_it_a_draw? == false do
        system "clear"
        round += 1
        
        puts ("_" *120).bold
        puts "ROUND #{round}".colorize(:blue).bold

        view.show_board

        round.odd? ? player = player1 : player = player2

        puts "#{player.name}, it's your turn"

        game.request_positions
        view.show_board

        gets.chomp

      end

      game.end
      gets.chomp
    end
    gets.chomp



  end

end

def main_menu
  system "clear"

  puts ("-" * 121).colorize(:cyan).bold
  print "|".colorize(:cyan).bold," " * 55, "Main Menu".colorize(:green).bold," " * 55,   "|".colorize(:cyan).bold, "\n"
  puts ("-" * 121).colorize(:cyan).bold
  print "\n"
  puts "What would you like to do?"
  print "To play the game, press ", "1".colorize(:magenta).bold, "\n"
  print "To see the rules, press ", "2".colorize(:magenta).bold, "\n"
  print "To see the statistics, press ", "3".colorize(:magenta).bold, "\n"
  print "To quit, press ", "q".colorize(:magenta).bold, "\n"
  case enter_choice
      when "1" then choice = 1
      when "2" then display_rules
      when "3" then see_stats
      when "q" then exit
      else 
          puts "Sorry, I did not understand"
          puts "Try again" 

  end

  choice == 1? choice : main_menu

end

def enter_choice
  print "\n"
  print "> "
  player_choice = gets.chomp
  return player_choice
end


def display_rules
  x = "X".colorize(:red).bold
  o = "O".colorize(:yellow).bold

  system "clear"
  puts ("-" * 121).colorize(:cyan).bold
  print "|".colorize(:cyan).bold," " * 57, "RULES".colorize(:green).bold," " * 57,   "|".colorize(:cyan).bold, "\n"
  puts ("-" * 121).colorize(:cyan).bold
  print "\n"
  puts "The purpose of the game is to align 3 similar patterns, either vertically, horizontally, or in diagonal,"
  puts "before your oponent, as shows below:"
  print "\n"
  puts "Vertically     Horizontally     In diagonal"
  puts "|#{x}| | |        |#{o}|#{o}|#{o}|          |#{x}| | |"
  puts "|#{x}| | |        | | | |          | |#{x}| |"
  puts "|#{x}| | |        | | | |          | | |#{x}|"
  
  gets.chomp

  puts "To play, the players will enter, one after another, the position of their respectives patterns"
  puts "The first player that manage to allign 3 patterns win"
  puts "If no one manages to allign the 3 patterns, this is a draw"
 
  gets.chomp

  puts "The positions are indicated by their coordinates, as following:"
  puts "   A B C"
  puts "1 | | | |"
  puts "2 | | | |"
  puts "3 | | | |"
  print "\n"
  puts "For example, to place a pattern in the middle cell, the player will have to indicate B2"
  puts "For the cell on the bottom left corner, this will be A3, etc."

  gets.chomp
  puts "To go back to the main menu, press any key"
  gets.chomp


end

def see_stats
  Game.number_of_games
end
