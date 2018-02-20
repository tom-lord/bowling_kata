class BowlingFrame
  def initialize(bowling_game, frame_number)
    @roll1 = 0
    @roll2 = 0
    @rolls_taken = 0
    @bowling_game = bowling_game
    @frame_number = frame_number
  end

  def roll(points, first_roll)
    if first_roll
      @roll1 = points
    else
      @roll2 = points
    end
    @rolls_taken += 1
  end

  def score
    if strike?
      10 + @bowling_game.score_of_two_rolls(@frame_number + 1)
    elsif spare?
      10 + @bowling_game.score_of_one_roll(@frame_number + 1)
    else
      @roll1 + @roll2
    end
  end

  def score_of_one_roll
    @roll1
  end

  def score_of_two_rolls
    if strike?
      10 + @bowling_game.score_of_one_roll(@frame_number + 1)
    else
      @roll1 + @roll2
    end
  end

  def finished?
    strike? || @rolls_taken == 2
  end

  private

  def strike?
    @roll1 == 10
  end

  def spare?
    @roll1 != 10 && @roll1 + @roll2 == 10
  end
end
