class Game

  attr_accessor :player, :rounds

  @@all = []

  def initialize
    @rounds = []
    @player = nil
    @@all << self
  end

  def play
    welcome
    player_name = ask_player_name
    add_player(player_name)
    round = new_round
    round.start
  end

  def welcome
    greeting = "Welcome to Hangman\n"
    puts greeting
  end

  def ask_player_name
    question = "What is your name?"
    puts question
    name = gets.chomp
  end

  def add_player(name)
    new_player = Player.new(name)
    new_player.game = self
    self.player = new_player
  end

  def new_round
    new_round = Round.new(self.player, self)
    self.rounds << new_round
    new_round
  end


end
