class Player
  # player has a game
  attr_accessor :name, :game, :rounds

  def initialize(name)
    @name = name
    @game = nil
    @rounds = []
  end

  def wins_and_losses
    wins_and_losses = {wins: 0, losses: 0}
    self.rounds.each do |round|
      if round.won
        wins_and_losses[:wins] += 1
      elsif !round.won
        wins_and_losses[:losses] += 1
      end
    end
    wins_and_losses
  end

end
