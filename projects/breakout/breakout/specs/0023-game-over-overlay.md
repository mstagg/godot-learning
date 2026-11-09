# 0023 · Game over overlay
Goal: A GAME OVER screen exists, darkening the whole window, ready for the state machine to show it later.
Behaviour:
- New scene scenes/game_over_overlay.tscn, instanced into game.tscn as GameOverOverlay, a child of the Game root; no script until 0024.
- GameOverOverlay (CanvasLayer) > Dim (ColorRect, Full Rect, black at 80% opacity) + CenterContainer (Full Rect) > VBoxContainer (16 px between lines) > three centred white labels.
- Labels: "GAME OVER" at 64, emboldened like the score; "SCORE 00000" at 34, fixed placeholder text; "PRESS SPACE TO TRY AGAIN" at 24.
- The CanvasLayer's Visible is the debug flag, saved off.
Done when:
- With Visible on, the whole window, score column included, is dark and faded with the three lines centred in it, and the ball and paddle still move behind it.
- With Visible off (as committed), the game looks exactly as before.
Not in this spec:
- Showing or hiding it from code or from the state
- The real score
- Pausing
- Space to restart
- A fade or animation
- A custom font or art
