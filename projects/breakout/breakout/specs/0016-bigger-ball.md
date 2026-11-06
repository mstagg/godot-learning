# 0016 · Bigger ball
Goal: The ball is 50% bigger, so it's easier to follow.
Behaviour:
- assets/ball.png is redrawn at 9×9; the Sprite stays at scale (2, 2), so 18 px on screen.
- ball.gd's radius default goes from 6 to 9, so the hitbox matches the sprite.
- Speed, serve and bounce rules are unchanged.
Done when:
- The ball is visibly bigger and still crisp 2×2 pixels.
- With Debug → Visible Collision Shapes on, the circle lines up with the sprite's edge.
- The game plays as before, just with a bigger ball.
Not in this spec:
- Keeping the sprite in sync if radius changes
- Brick or paddle art
