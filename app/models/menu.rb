# This class will loop the game and offer stats

class Menu
  attr_accessor :game, :player

  def initialize(player)
    @player = player
    self.player.menu = self
  end

  def options
    loop do
      options = <<-TEXT
      MENU OPTIONS
      1. Your score
      2. Hangman
      3. Quit
      TEXT
      puts options
      answer = gets.chomp
      case answer
      when '1'
        self.score
      when '2'
        break
      when '3'
        quit
      else
        puts "Invalid input: please select 1, 2, or 3."
      end
    end
  end

  def quit
    puts "Goodbye"
    exit(0)
  end

  def score
    score = self.player.wins_and_losses
    puts "You've won #{score[:wins]} times and lost #{score[:losses]} times."
  end

end
