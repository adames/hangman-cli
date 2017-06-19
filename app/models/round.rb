class Round
  # Round belongs to a player
  # Game has rounds

  @@all = []

  def initialize(player)
    @player = player
    @wrong_guesses = 0
    @word = nil #This will be randomly generated later.
    @invalid_guesses = []
    @valid_guesses = []

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
    split_word.join
  end

  def players_guess
    #this collects the player's guess and determins validity
  end

  def won?
    # won the game?
  end

end
