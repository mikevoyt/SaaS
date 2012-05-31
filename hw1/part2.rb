class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end
def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
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

def rps_tournament_winner(tourney)
  sub_tourney_winners = []
  tourney.each do |sub_tourney|
    game_winners = []
    sub_tourney.each do |game|
      winner = rps_game_winner(game)
      game_winners.push(winner)
    end
    winner = rps_game_winner(game_winners)
    sub_tourney_winners.push(winner)
  end
  winner = rps_game_winner(sub_tourney_winners)
  p winner
end

#p rps_game_winner([ [ "Armando", "p" ], [ "Dave", "s" ] ])
tourney = [ [
                [ ["Armando", "P"], ["Dave", "S"] ],
                [ ["Richard", "R"],  ["Michael", "S"] ],
            ],
            [
                [ ["Allen", "S"], ["Omer", "P"] ],
                [ ["David E.", "R"], ["Richard X.", "P"] ]
            ] ]
rps_tournament_winner(tourney)