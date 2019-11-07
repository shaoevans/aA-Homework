class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []

  end

  def play
    until @game_over
      self.take_turn
    end
    self.game_over_message
    self.reset_game

  end

  def take_turn
    self.show_sequence
    self.require_sequence
    if !@game_over
      self.round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    self.add_random_color
    @seq.each do |color|
      system("clear")
      puts color
      sleep(1)
    end
  end

  def require_sequence
    counter = 0
    until counter = @seq.length 
      input = gets.chomp
      if input == @seq[i]
        counter += 1
      else
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    "You nailed it!"
  end

  def game_over_message
    "Game Over"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
