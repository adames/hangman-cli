class Game

  attr_accessor :players, :rounds, :display, :menu, :exit_game

  @@all = []

  def initialize
    @rounds = []
    @players = []
    @exit_game = false
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
    add_menu
    until self.exit_game
      menu.options
      play_round
    end
  end

  def play_round
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
    self.players << new_player
  end

  def add_menu
    self.menu = Menu.new(self.players.last)
  end

  def new_round
    new_round = Round.new(self.players.last, self)
    new_round.display = self.display
    self.rounds << new_round
    new_round
  end


end
