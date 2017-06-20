class Round
  # Round belongs to a player
  # Game has rounds
  attr_accessor :word_array, :won, :wrong_guesses, :guesses, :display

  @@all = []

  def initialize(player, game)
    @player = player
    @game = game
    @wrong_guesses = 0
    @word_array = [] #This will be randomly generated later.
    @guesses = []
    @won = nil
    @player.rounds << self
    @@all << self
    @display = nil
  end

  def self.all
    @@all
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
    puts "That was correct!"
    self.display.hangman(self.wrong_guesses)
    if self.word_array - self.guesses == []
      self.won = true
      puts 'Congratulation, you won!'
    end
  end

  def incorrect_guess
    #add wrong guesses
    puts "That was incorrect!"
    self.wrong_guesses += 1
    self.display.hangman(self.wrong_guesses)
    puts "You have #{6 - self.wrong_guesses} guesses left!"
    if self.wrong_guesses >= 6
      self.won = false
      puts 'You lost!'
      puts "The word was #{word_array.join}"
    end
  end

  def correct?(guess)
    self.word_array.include? guess
  end

  def generate_word
    word = pick_random_line
    word.split('')
  end

  def pick_random_line
    File.readlines("app/words").sample.strip
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
    puts "The word is: #{hidden_word.join}"
    hidden_word.join
  end

  def players_guess
    #this collects the player's guess and determines validity
    print "What is your guess? "
    guess = gets.chomp.downcase
    until valid_guess? guess
      print "Guess again: "
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
      print 'Your guess was too long. '
      return false
    end
    unless (('a'..'z').to_a.include? guess)
      print 'Guess must be a letter. '
      return false
    end
    unless !self.guesses.include? guess
      print 'You already guessed that. '
      return false
    end
    true
  end

end
