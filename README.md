# Bowling Kata

Based (losely) on: http://butunclebob.com/ArticleS.UncleBob.TheBowlingGameKata

This implementation was written under tight time constraints - The code is far from perfect!

[This line](https://github.com/tom-lord/bowling_kata/blob/46b6b85ad6f490bcf1fd9d3527b0dcbcfb06d2ea/lib/bowling_game.rb#L9):

```
@frames = Array.new(9) { |i| BowlingFrame.new(self, i + 1) } + [BowlingFrameFinal.new]
```

is probably the most interesting part of the implementation.

An alternative variation to this could also have been:

```
@frames = Array.new(9) { BowlingFrame.new } + [BowlingFrameFinal.new]
@frames.each_cons(2) { |f1, f2| f1.next_frame = f2 }
```

Either way, the key to this solution is that each frame (other than the last!) can access the
_next frame's score_ - and therefore use it as part of the calculation for its _own_ score.
