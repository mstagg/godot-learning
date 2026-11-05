# 0010 · Brick grid
Goal: A wall of bricks fills the top of the screen, and comes back whenever the game resets.
Behaviour:
- game.gd preloads brick.tscn; reset_game() frees any remaining bricks, then builds a fresh grid with instantiate() + add_child().
- Bricks are children of a new empty Node2D "Bricks" in game.tscn.
- 3 rows × 12 columns, no gaps; brick width = screen width ÷ columns (96 px), height 24, top of the grid 48 px down.
- brick_rows, brick_columns, brick_height and grid_top_margin are @export vars on game.gd.
- Each brick is yellow with a 2px black border: a black Border ColorRect with a yellow Fill ColorRect inset on top.
- The "bricks" group is set on brick.tscn's root, so every brick has it; nothing reads it yet.
- The hand-placed Brick, _place_brick() and brick_top_margin from 0009 are removed.
Done when:
- 36 yellow bricks with black borders fill the top edge to edge, 48 px down.
- The ball breaks them one at a time.
- After a miss, all 36 bricks are back.
- In Scene → Remote, Bricks has 36 children, and a selected brick shows "bricks" under Node → Groups.
- Setting brick_columns to 10 in the Inspector before F5 still fills the width.
Not in this spec:
- Score or signals
- A level-clear or win check
- Different colours per row
- Multi-hit bricks
- Aimed paddle bounce
- Editor previews (@tool)
