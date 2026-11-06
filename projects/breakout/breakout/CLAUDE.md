# Breakout

Godot 4.7.2 Breakout clone. The owner is learning Godot by reviewing agent-written code, so every change must be small and reviewable.

## Workflow
- Work from one spec in `specs/` (`NNNN-name.md`). Implement the whole spec in one go; specs are small enough to review as a single diff.
- When done, stop. Walk through what changed, file by file, and why, then wait for the owner's review.
- Do only what the spec says. Anything else goes in the spec's "Not in this spec" list, not in the code.
- Exception: anything the change leaves dangling or redundant (unused nodes, exports, functions, calls, resources, files) is always removed in the same spec, whether or not the spec lists it. Treat it like fixing a regression, and name each removal in the walkthrough.
- One spec, one commit. Commit only when asked.
- Art is hand-made or free-licensed (Kenney first). Use plain placeholder shapes until real art exists.

## Verify
- `godot --path . --import` catches broken scenes and resources.
- `godot --path . --headless --quit-after 600` smoke-tests the main scene for about 10 seconds, long enough for the ball to drain and the game to reset at least once. Godot silently ignores unknown flags, so check the output for errors rather than trusting the exit code.
- `godot --path . --headless --check-only --script res://<path>.gd` type-checks one script. Run it on every `.gd` file, one at a time. A clean script prints nothing, and the exit code is 0 even on errors, so read the output.
- Run all three after building. Report errors verbatim.

## GDScript
- Typed everywhere: `var speed: float = 300.0`, `func _ready() -> void`.
- Follow the official style guide: tabs, `snake_case` functions and variables, `PascalCase` classes and nodes, `UPPER_SNAKE` constants.
- Always prefix the current class's members with `self.`, even when it's verbose: properties (including inherited ones like `self.velocity` and `self.position`), `@onready` and `@export` vars, and method calls like `self.move_and_slide()`. The owner uses it to tell members from local variables. This overrides the style guide's default.
- Input goes through Input Map actions, never raw keycodes (gamepad and Steam Deck support depend on it).
- Do not multiply by `delta` before `move_and_slide()`; the engine applies it.
- Tunable values are `@export` variables, not magic numbers.
- Communicate upward with signals, downward with method calls.
- Pick the node type for the job (`CharacterBody2D`, `Area2D`, `StaticBody2D`, `RigidBody2D`) and say why in the step explanation.

## Layout
- `scenes/` for `.tscn`, `scripts/` for `.gd`, `specs/` for specs. Each scene gets a script of the same name.
- `art/` holds the owner's Aseprite sources (`.aseprite`); it has a `.gdignore`, so Godot never sees it. `assets/` holds the exported PNGs that scenes use. Reference textures from `assets/` only, and never edit or regenerate files in either folder.
- Edit `.tscn` and `project.godot` by hand only when the change is trivial; say so when you do.
