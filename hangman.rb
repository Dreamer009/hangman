#NEED TO END GAME AFTER ALL LETTERS ARE GUESSED
#NEED TO HAVE GUESSES COUNT FOR DUPLICATE LETTERS
class Hangman
  attr_accessor :word, :letters, :guess_count, :display_word, :word, :saved_word, :bad_guesses
  def initialize()
  end

  def get_word
    new_word = nil
    while new_word.nil? || new_word.length == 0 do
      puts "\n\n\n Starting new game of hangman \n\n Enter word or phrase to guess: "
      new_word = gets.gsub(/[^a-z\s]/, "").gsub(/\s+/, " ").downcase.strip
    end
    @display_word = new_word.gsub(/\w/, "_")
    system "clear"
    return new_word
  end
  def draw_hangman
    if @guess_count < 6
      puts "You have #{6 - @guess_count} guesses remaining"
    else
      puts "
      |------|
      |     (0)
      |     /|\\
      |      |
      |     / \\
      |
      |
      |--------------|
      "
    end
    if @guess_count == 5
      puts "
      |------|
      |
      |     /|\\
      |      |
      |     / \\
      |
      |
      |--------------|
      "
    end
      if @guess_count == 4
        puts "
        |------|
        |
        |     /|
        |      |
        |     / \\
        |
        |
        |--------------|
        "
      end
      if @guess_count == 3
        puts "
        |------|
        |
        |      |
        |      |
        |     / \\
        |
        |
        |--------------|
        "
      end
      if @guess_count == 2
        puts "
        |------|
        |
        |      |
        |      |
        |     /
        |
        |
        |--------------|
        "
      end
        if @guess_count == 1
          puts "
          |------|
          |
          |      |
          |      |
          |
          |
          |
          |--------------|
          "
        end
        if @guess_count == 0
          puts "
          |------|
          |
          |
          |
          |
          |
          |
          |--------------|
          "
        end
  end
  def show_current_line
    # todo: draw guess line with _ where guess is missing and char where correct guess
    puts "correct guesses: " + @display_word.split(//).join(" ")
    puts "incorrect guesses: " + @bad_guesses.sort.uniq.join(", ")
  end

  def get_guess
    my_guess = nil
    while my_guess.nil? do
      puts "Letter to guess: "
      my_guess = gets.downcase.gsub(/[^a-z]/, "")[0]
      if @bad_guesses.index(my_guess)
        puts "you already guessed #{my_guess}!"
        my_guess = nil
      end
    end
    return my_guess
  end

  def play_game
    solved = false
    @guess_count = 0
    @bad_guesses = []
    while !solved && @guess_count < 6 do
      show_current_line
      guess = get_guess
      puts "GUESS is #{guess}"
      character_number = self.word.index(guess)
      if character_number
        while character_number do
          @display_word[character_number] = guess
          @word[character_number] = " "
          character_number = @word.index(guess)
        end
        puts "correct"
        solved = (@word.strip.size == 0)

        # do something with the right guess

      else
        puts "guess is wrong"
        @guess_count = @guess_count + 1
        @bad_guesses.push(guess)
        if @guess_count == 6
          puts "GAME OVER!"
          puts "correct word was " + @saved_word
          return
        end
      end
      draw_hangman

    end
    if solved
      puts "YOU WIN!"
    end
  end


  def play
    while true do
      @word = get_word
      @saved_word = @word.dup
      play_game
      puts "Do you want to play another game? (y/n)"
      answer = gets.strip
      if answer =~ /^n/i
        puts "Goodbye!"
        return
      end
    end
  end
end

hm = Hangman.new
hm.play
