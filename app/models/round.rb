class Round
  # Round belongs to a player
  # Game has rounds
  attr_accessor :word
  attr_reader :valid_guesses

  @@all = []

  def initialize(player)
    @player = player
    @wrong_guesses = 0
    @word = nil #This will be randomly generated later.
    @guesses = []

    @@all << self
  end

  def start
    self.word = generate_word
    display_hidden_word(self.word)
    players_guess
  end

  def generate_word
    self.word = "hangman"
  end

  def display_hidden_word(word)
    #hide all but valid guesses
    split_word = word.split ""
    split_word.map! do |letter|
      if valid_guesses.include? letter
        letter
      else
        '_'
      end
    end
    puts "Word: #{split_word.join}"
    split_word.join
  end

  def players_guess
    #this collects the player's guess and determines validity
    puts "What is your guess?"
    guess = gets.chomp.downcase
    until valid_guess? guess
      puts "Invalid guess, guess again."
      guess = gets.chomp.downcase
    end
    is_right?

  end

  def is_right? guess
    if self.word.split("").include? guess
      #We're here now
    end
  end


  def valid_guess?(guess)
    unless guess.length == 1
      puts 'too long'
      return false
    end
    unless (('a'..'z').to_a.include? guess)
      puts 'not a..z'
      return false
    end
    unless !self.guesses.include? guess
      puts 'already guessed'
      return false
    end
    true
  end

  def won?
    # won the game?
  end

end
