class Round

  @all = []

  def initialize
    @guesses = 0
    @word = "Hangman" #This will be randomly generated later.
    @@all << self
  end

end
