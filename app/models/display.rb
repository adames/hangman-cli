class Display

  def hangman(wrong_guesses)
    case wrong_guesses
    when 0 then nothing
    when 1 then head
    when 2 then body
    when 3 then left_arm
    when 4 then right_arm
    when 5 then left_leg
    when 6 then right_leg
    end
  end

  def nothing
    ascii = <<-ASCII
    0000000000000
    0           0
    0
    0
    0
    0
    0
    0
    0
    0
    0
    0
    0
    0
    00000000000000000
   ASCII
   puts ascii
  end

  def head
    ascii = <<-ASCII
    0000000000000
    0           0
    0           1
    0          1 1
    0           1
    0
    0
    0
    0
    0
    0
    0
    0
    0
    00000000000000000
   ASCII
   puts ascii
  end

  def body
    ascii = <<-ASCII
    0000000000000
    0           0
    0           1
    0          1 1
    0           1
    0           2
    0           2
    0           2
    0
    0
    0
    0
    0
    0
    00000000000000000
   ASCII
   puts ascii
  end

  def left_arm
    ascii = <<-ASCII
    0000000000000
    0           0
    0           1
    0          1 1
    0           1
    0          32
    0         3 2
    0        3  2
    0
    0
    0
    0
    0
    0
    00000000000000000
   ASCII
   puts ascii
  end

  def right_arm
    ascii = <<-ASCII
    0000000000000
    0           0
    0           1
    0          1 1
    0           1
    0          324
    0         3 2 4
    0        3  2  4
    0
    0
    0
    0
    0
    0
    00000000000000000
   ASCII
   puts ascii
  end

  def left_leg
    ascii = <<-ASCII
    0000000000000
    0           0
    0           1
    0          1 1
    0           1
    0          324
    0         3 2 4
    0        3  2  4
    0          5
    0         5
    0        5
    0       5
    0
    0
    00000000000000000
   ASCII
   puts ascii
  end

  def right_leg
    ascii = <<-ASCII
    0000000000000
    0           0
    0           1
    0          1 1
    0           1
    0          324
    0         3 2 4
    0        3  2  4
    0          5 6
    0         5   6
    0        5     6
    0       5       6
    0
    0
    00000000000000000
   ASCII
   puts ascii
  end

  def title
    ascii = <<-ASCII
    888
    888
    888
    88888b.  8888b. 88888b.  .d88b. 88888b.d88b.  8888b. 88888b.
    888 "88b    "88b888 "88bd88P"88b888 "888 "88b    "88b888 "88b
    888  888.d888888888  888888  888888  888  888.d888888888  888
    888  888888  888888  888Y88b 888888  888  888888  888888  888
    888  888"Y888888888  888 "Y88888888  888  888"Y888888888  888
                                 888
                            Y8b d88P
                             "Y88P"                               
    ASCII
    puts ascii
  end



end
