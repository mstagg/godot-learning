# 0027 · You win
Goal: Clearing the last level freezes the game behind YOU WIN with my final score, and Space plays again from level 1.
Behaviour:
- New scenes/win_overlay.tscn, copied from the game over overlay (same dim and layout): "YOU WIN", "SCORE 00000", "PRESS SPACE TO PLAY AGAIN". Own script scripts/win_overlay.gd (class_name WinOverlay) with set_score(score); instanced into game.tscn as WinOverlay, saved hidden. Two overlays, because they'll likely differ over time.
- New state WON. _set_state() pauses whenever the state isn't PLAYING; each overlay is visible exactly in its own state.
- The _score_total setter updates the win overlay too.
- On level_cleared: when _level is levels.size(), go to WON; otherwise advance as now. Levels no longer wrap, so the % goes.
- Space in GAME_OVER or WON: reset_game(), then PLAYING.
Done when:
- With starting_level 2, clearing the box freezes the game: YOU WIN, my score, PRESS SPACE TO PLAY AGAIN.
- Space gives Level 1, 00000, "Extra Lives: 2" and the ball held.
- Losing the last life still shows GAME OVER and TRY AGAIN.
Not in this spec:
- High scores
- A bonus for leftover lives
- A message between levels
- A celebration animation
- More levels
