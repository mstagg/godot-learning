# 0025 · Level 1 layout
Goal: Level 1 is an easier wall of three groups of bricks, two rows deep, so I can actually clear it.
Behaviour:
- game_window.gd replaces brick_rows and brick_columns with @export var layout: PackedStringArray: one string per row, X = brick, . = gap.
- Columns come from the string length, rows from the number of strings; brick width is screen width / columns, as before.
- Level 1 is:
  .XXX.XXX.XXX.
  .XXX.XXX.XXX.
  13 columns of 88.6 px, 18 bricks.
- Rows still start at grid_top_margin with brick_height, touching.
Done when:
- The game starts with two rows of three groups, with gaps at both edges and between groups.
- The ball can pass through the gaps and bounce off the top wall.
- A game-over restart rebuilds the same pattern.
Not in this spec:
- Level clear
- Level 2 and more layouts
- Brick types or colours
- Layouts loaded from files
