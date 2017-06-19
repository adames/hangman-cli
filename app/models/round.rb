class Round
  # Round belongs to a player
  # Game has rounds
  attr_accessor :word_array, :won, :wrong_guesses, :guesses

  @@all = []

  def initialize(player, game)
    @player = player
    @game = game
    @wrong_guesses = 0
    @word_array = [] #This will be randomly generated later.
    @guesses = []
    @won = nil
    @player.rounds << self
    #let's add a way to hold words already split in a method

    @@all << self
  end

  def start
    self.word_array = generate_word
    and_around # round.and_around
  end

  def and_around
    # This loops until a players wins or loses
    while self.won == nil
      display_hidden_word(self.word_array)
      guess = players_guess
      if self.correct? guess
        correct_guess
      else
        incorrect_guess
      end
    end
  end

  def correct_guess
    puts "that was correct"
    if self.word_array - self.guesses == []
      self.won = true
      puts 'you won!'
    end
  end

  def incorrect_guess
    #add wrong guesses
    puts "that was incorrect"
    self.wrong_guesses += 1
    puts "you have #{5 - self.wrong_guesses} left!"
    if self.wrong_guesses >= 5
      self.won = false
      puts 'you lost!'
    end
  end

  def correct?(guess)
    self.word_array.include? guess
  end

  def generate_word
    self.word_array = ['h', 'a', 'n', 'g', 'm', 'a', 'n']
  end

  def display_hidden_word(word_array)
    #hide all but valid guesses

    hidden_word = word_array.map do |letter|
      if guesses.include? letter
        letter
      else
        '_'
      end
    end
    puts "Word: #{hidden_word.join}"
    hidden_word.join
  end

  def players_guess
    #this collects the player's guess and determines validity
    puts "What is your guess?"
    guess = gets.chomp.downcase
    until valid_guess? guess
      puts "Invalid guess, guess again."
      guess = gets.chomp.downcase
    end
    self.guesses << guess
    guess
  end

  def is_right? guess
    if self.word_array.include? guess
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

end
