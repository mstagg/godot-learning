# 0006 · Reset and serve
Goal: The game sets itself up from one reset function, and the ball heads down-left or down-right at random.
Behaviour:
- main.gd has reset_game(): paddle centred near the bottom, ball at the screen centre, then ball.serve().
- _ready() calls reset_game() on game start; walls are still placed once in _ready, outside reset_game().
- ball.serve() sends the ball down at 45° at its speed, with a 50/50 chance of left or right.
- The ball no longer starts itself in its own _ready().
Done when:
- Running the game shows the ball at the centre moving down at 45°, and the paddle centred.
- Over several runs, the ball sometimes heads down-left and sometimes down-right.
Not in this spec:
- The drain, or anything else that calls reset_game() during play (0007)
- Lives, score, a restart key
