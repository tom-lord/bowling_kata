class BowlingFrameFinal
  def initialize
    @roll1 = 0
    @roll2 = 0
    @roll3 = 0
    @rolls_taken = 0
  end

  def roll(points, _first_roll)
    if @rolls_taken == 0
      @roll1 = points
    elsif @rolls_taken == 1
      @roll2 = points
    else
      @roll3 = points
    end
    @rolls_taken += 1
  end

  def score
    @roll1 + @roll2 + @roll3
  end

  def score_of_one_roll
    @roll1
  end

  def score_of_two_rolls
    @roll1 + @roll2
  end

  def finished?
    @rolls_taken == (strike_or_spare? ? 3 : 2)
  end

  private

  def strike_or_spare?
    @roll1 == 10 || @roll1 + @roll2 == 10
  end
end
