class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end
def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
#  game.each do |entry|
#    strategy = entry[1].downcase
#    raise NoSuchStrategyError unless (strategy == "p" || strategy == "r" || strategy == "s")
#  end
  player1 = game[0]
  player2 = game[1]
  player1_strategy = player1[1].downcase
  player2_strategy = player2[1].downcase
  case player1_strategy
    when "r"
      if player2_strategy == "r"
        winner = player1
      elsif player2_strategy == "p"
        winner = player2
      elsif player2_strategy == "s"
        winner = player1
      else raise NoSuchStrategyError
      end
    when "p"
      if player2_strategy == "r"
        winner = player1
      elsif player2_strategy == "p"
        winner = player1
      elsif player2_strategy == "s"
        winner = player2
      else raise NoSuchStrategyError
      end
    when "s"
      if player2_strategy == "r"
       winner = player2
      elsif player2_strategy == "p"
        winner = player1
      elsif player2_strategy == "s"
        winner = player1
      else raise NoSuchStrategyError
      end
    else raise NoSuchStrategyError
  end
  return winner
end

#p rps_game_winner([ [ "Armando", "p" ], [ "Dave", "s" ] ])
