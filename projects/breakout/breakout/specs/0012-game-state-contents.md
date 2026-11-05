# 0012 · Game state window contents
Goal: The info column shows the score at the top and the level at the bottom.
Behaviour:
- game_state_window.tscn: Background stays; a MarginContainer (8px left/right, 16px top/bottom) wraps the VBoxContainer.
- VBoxContainer children: ScoreLabel, a Spacer Control that expands vertically, LevelLabel.
- ScoreLabel reads "00000" (hard-coded), 34px, extra-bold via a FontVariation (embolden 1) on the default font, white, centred.
- LevelLabel reads "Level 1" (hard-coded), 24px, default weight, white, centred.
- No script yet.
Done when:
- "00000" is centred at the top of the dark column, on one line, without touching the column edges.
- "Level 1" is centred at the bottom.
- Both show in the 2D editor without running.
- The game plays as before.
Not in this spec:
- A real score, or signals
- Level logic
- Lives
- A custom font or theme
- Shrinking long scores to fit
