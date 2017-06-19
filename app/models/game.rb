class Game

  attr_accessor :player

  @@all = []

  def initialize
    @rounds = []
    @player = nil
    @@all << self
  end

  def runner
    welcome
    name = ask_player_name
    new_player = Player.new(name)
    self.player = new_player
    start_round
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

  def start_round
    new_round = Round.new(self.player)
    new_round.start
  end


end
