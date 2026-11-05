# 0014 · Faster ball, speeding up on paddle hits
Goal: The ball starts quicker and gets faster every time I return it with the paddle.
Behaviour:
- The ball's starting speed is 325 px/s (was 200).
- Each paddle hit adds speed_increase (@export, 20 px/s), up to max_speed (@export, 600 px/s); direction is unchanged.
- The paddle gets class_name Paddle; after bouncing, the ball checks "is Paddle", like the brick check.
- Walls and bricks don't change the speed.
- A miss resets the speed: serve() starts from 325 again.
Done when:
- The ball starts noticeably faster than before, and each paddle catch makes it slightly faster.
- In Scene → Remote, the ball's velocity starts at ±229.8 on x and y, grows by about 14.1 per catch, and never passes ±424.3.
- Walls and bricks leave the velocity unchanged.
- After a miss, it's back to ±229.8.
Not in this spec:
- Aimed bounce off the paddle
- Speeding up on bricks or walls
- An on-screen speed display
- Difficulty levels
- Sounds
