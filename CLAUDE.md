# Breakout

Godot 4.7.2 Breakout clone. The owner is learning Godot by reviewing agent-written code, so every change must be small and visible.

## Workflow
- Work from one spec in `specs/` (`NNNN-name.md`). Implement it one step at a time.
- After each step, stop. Show what changed, explain why, and wait for "next".
- Do only what the current step says. Anything else goes in the spec's "Not in this spec" list, not in the code.
- One spec, one commit. Commit only when asked.
- Art is hand-made or free-licensed (Kenney first). Use plain placeholder shapes until real art exists.

## Verify
- `godot --path . --import` catches broken scenes and resources.
- `godot --path . --headless --quit-after 60` smoke-tests the main scene. Godot silently ignores unknown flags, so check the output for errors rather than trusting the exit code.
- Run both after every step. Report errors verbatim.

## GDScript
- Typed everywhere: `var speed: float = 300.0`, `func _ready() -> void`.
- Follow the official style guide: tabs, `snake_case` functions and variables, `PascalCase` classes and nodes, `UPPER_SNAKE` constants.
- Input goes through Input Map actions, never raw keycodes (gamepad and Steam Deck support depend on it).
- Do not multiply by `delta` before `move_and_slide()`; the engine applies it.
- Tunable values are `@export` variables, not magic numbers.
- Communicate upward with signals, downward with method calls.
- Pick the node type for the job (`CharacterBody2D`, `Area2D`, `StaticBody2D`, `RigidBody2D`) and say why in the step explanation.

## Layout
- `scenes/` for `.tscn`, `scripts/` for `.gd`, `specs/` for specs. Each scene gets a script of the same name.
- Edit `.tscn` and `project.godot` by hand only when the change is trivial; say so when you do.
