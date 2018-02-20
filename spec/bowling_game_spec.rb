require 'bowling_game'
RSpec.describe 'BowlingGame' do
  it 'gets the right final score for simple game' do
    game = BowlingGame.new
    game.roll(3) until game.finished?
    expect(game.score).to eq 60
  end

  it 'gets the right final score with a spare' do
    game = BowlingGame.new
    game.roll(3)
    game.roll(7)
    game.roll(3) until game.finished?
    expect(game.score).to eq 67
  end

  it 'gets the right final score with multiple spares' do
    game = BowlingGame.new
    game.roll(3)
    game.roll(7)
    game.roll(6)
    game.roll(4)
    game.roll(3) until game.finished?
    expect(game.score).to eq 77
  end

  it 'gets the right final score with a strike' do
    game = BowlingGame.new
    game.roll(10)
    game.roll(3) until game.finished?
    expect(game.score).to eq 70
  end

  it 'gets the right final score with two strikes' do
    game = BowlingGame.new
    game.roll(10)
    game.roll(10)
    game.roll(3) until game.finished?
    expect(game.score).to eq 87
  end

  it 'gets the right final score with strike in final frame' do
    game = BowlingGame.new
    18.times { game.roll(3) } #  score 54
    game.roll(10)
    game.roll(1)
    game.roll(1)
    expect(game.score).to eq 66
  end

  it 'really works' do
    game = BowlingGame.new
    12.times { game.roll(10) }
    expect(game.score).to eq 300
  end
  it 'really really works' do
    game = BowlingGame.new
    20.times { game.roll(0) }
    expect(game.score).to eq 0
  end
end
