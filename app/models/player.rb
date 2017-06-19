class Player
  #player has a game
  attr_accessor :name, :game, :rounds

  def initialize(name)
    @name = name
    @game = nil
    @rounds = []
  end

  def wins_and_losses
    #writing now
  end

end
