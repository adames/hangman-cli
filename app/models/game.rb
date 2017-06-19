class Game

  attr_accessor :word, :player_guess, :word_bank


  @@hi_scores = {wins: 0, losses: 0}

  def initialize
    @word = 'hangman'
    @player_guess = 0
    @word_bank = []
  end

  def welcome
    greeting = ""
    puts greeting
    start_round
  end

  def start_round

  end


end
