require_relative 'bowling_frame'
require_relative 'bowling_frame_final'
require 'pry'

class BowlingGame
  def initialize
    @frame_number = 1 # 10 frames in a game!
    @first_roll = true
    @frames = Array.new(9) { |i| BowlingFrame.new(self, i + 1) } + [BowlingFrameFinal.new]
  end

  def roll(points)
    current_frame.roll(points, @first_roll)
    if current_frame.finished?
      @frame_number += 1
      @first_roll = true
    else
      @first_roll = false
    end
  end

  def score
    @frames.map(&:score).inject(:+)
  end

  def score_of_one_roll(frame_number)
    @frames[frame_number - 1].score_of_one_roll
  end

  def score_of_two_rolls(frame_number)
    @frames[frame_number - 1].score_of_two_rolls
  end

  def finished?
    @frame_number > 10
  end

  private

  def current_frame
    @frames[@frame_number - 1]
  end
end
