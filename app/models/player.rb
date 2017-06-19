class Player
  #player has a game
  attr_accessor :name, :game

  def initialize(name)
    @name = name
    @game = nil
    @rounds = []
  end

end
