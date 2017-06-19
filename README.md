# hangman-cli
Hangman for CLI in Ruby

architecture

game flow
  welcome
  play a round?

  Round
    round setup
      new word from dictionary
      show player hidden word
      player guess (5)
      guesses word bank
    guess
      is_valid?
        if not, reloop
        if yes, continue
    if, is_correct?
      if wrong, wrong flow
        add to guesses
        add letter to word bank
        add limb to Hangman
        check if lost
      if right, right flow
        show correct letters in word to user
        check if won
    win flow
      you won!
      add their win count
    lost flow
      you lost!
      add their win count
  loop back to beginning
