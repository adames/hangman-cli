class Game

  attr_accessor :player, :rounds, :display

  @@all = []

  def initialize
    @rounds = []
    @player = nil
    @display = Display.new
    @@all << self
  end

  def self.all
    @@all
  end

  def play
    self.display.title
    welcome
    player_name = ask_player_name
    add_player(player_name)
    game_loop
    binding.pry
  end

  def game_loop
    loop do
      round = new_round
      round.start
      score = self.player.wins_and_losses
      puts "You've won #{score[:wins]} times and lost #{score[:losses]} times."
      puts "Do you want to quit? (y/n)"
      answer = gets.chomp.downcase
      if answer == 'y' || answer == 'yes'
        break
      end
    end
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
    new_round.display = self.display
    self.rounds << new_round
    new_round
  end


end
