# 0017 · Brick and paddle sprites
Goal: Bricks and the paddle show my pixel art at whatever size they are.
Behaviour:
- New scripts/pixel_nine_patch.gd: class_name PixelNinePatch extends NinePatchRect, const ART_SCALE = 2.0, and fit(target_size) that sets size = target_size / ART_SCALE, scale = ART_SCALE, and centres it.
- Brick: Border and Fill are replaced by a PixelNinePatch child, Art, using assets/brick.png, margins 2 on every side.
- Paddle: its ColorRect is replaced by a PixelNinePatch child, Art, using assets/paddle.png, margins left 2, right 2, top 0, bottom 0.
- Both axes Stretch. brick.gd and paddle.gd call self._art.fit(self.size); collision shapes are unchanged.
- brick.gd's border_width is removed; the outline is in the art.
Done when:
- Every brick and the paddle show my art, crisp 2×2 pixels, with corners and the paddle's dome ends unstretched.
- Changing brick_columns or the paddle's size in the Inspector still fits the art.
- With Visible Collision Shapes on, each hitbox matches its art.
- Hits, score, bounces and resets work as before.
Not in this spec:
- Fractional brick widths (some outlines a pixel off)
- The ball's sprite scale using ART_SCALE
- Per-row brick colours, cracked bricks
- A pixel-art base resolution
