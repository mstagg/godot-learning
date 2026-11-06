# 0015 · Ball sprite
Goal: The ball is my own pixel-art sprite, crisp, with the same round hitbox.
Behaviour:
- The play area's SubViewport: Canvas Items → Default Texture Filter: Nearest. The project setting stays Nearest.
- Ball gets a Sprite2D child, Sprite, showing assets/ball.png, centred, scale (2, 2).
- ball.gd's _draw() and color export are removed.
- The collision circle stays radius 6 (12 px, the sprite's size).
Done when:
- The ball shows my sprite, centred, the same size as before.
- Zoomed in on a screenshot, its pixels are hard 2×2 squares with no blur.
- In Scene → Remote, Ball/Sprite has scale (2, 2) and Ball is scale (1, 1).
- The game plays exactly as before.
Not in this spec:
- Brick or paddle art
- Keeping the sprite in sync if radius changes
- A pixel-art base resolution
