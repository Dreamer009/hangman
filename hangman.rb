class Hangman
  attr_accessor :word, :letters
  def initialize()
  end

  def get_word
    puts "Enter word to guess: "
    new_word = gets.strip
    system "clear"
    return new_word
  end

  def draw_hangman
    # todo: draw hangman here using guess_count
    puts "hangman drawing"
  end

  def show_current_line
    # todo: draw guess line with _ where guess is missing and char where correct guess
    puts "hangman line"
  end

  def get_guess
    puts "Letter to guess: "
    my_guess = gets.strip
    return my_guess
  end

  def play_game
    solved = false
    guess_count = 0
    while !solved do
      draw_hangman
      show_current_line
      guess = get_guess
      puts "GUESS is #{guess}"
      if self.word.index(guess)
        puts "correct"
        # do something with the right guess
      else
        puts "guess is wrong"
        guess_count = guess_count + 1
      end
    end
  end

  def play
    while true do
      letters = []
      self.word = get_word
      if self.word.to_s.length == 0
        puts "Goodbye!"
      end
      play_game
    end
  end

end

hm = Hangman.new
hm.play
