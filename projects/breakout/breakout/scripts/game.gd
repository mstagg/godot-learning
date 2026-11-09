extends HBoxContainer

enum State { PLAYING, GAME_OVER }

# Spare balls: the one in play isn't counted, so 2 means three balls in total.
@export var starting_lives: int = 2
@export var starting_level: int = 1
# The level scenes in play order; past the last one they wrap round to the first.
@export var levels: Array[PackedScene] = []

var _state: State = State.PLAYING
var _score_total: int = 0:
	set(value):
		_score_total = value
		# The setter can run before the child nodes exist (while the scene loads).
		if self.is_node_ready():
			self._game_state_window.set_score(_score_total)
			self._game_over_overlay.set_score(_score_total)
var _lives: int = 0:
	set(value):
		_lives = value
		# Same guard as the score: the setter can run before the child nodes exist.
		if self.is_node_ready():
			self._game_state_window.set_lives(_lives)
var _level: int = 1:
	set(value):
		_level = value
		# Same guard as the score: the setter can run before the child nodes exist.
		if self.is_node_ready():
			self._game_state_window.set_level(_level)

@onready var _play_area: GameWindow = $GameWindow/SubViewport/PlayArea
@onready var _game_state_window: GameStateWindow = $GameStateWindow
@onready var _game_over_overlay: GameOverOverlay = $GameOverOverlay


func _ready() -> void:
	self._play_area.points_scored.connect(self._on_points_scored)
	self._play_area.ball_lost.connect(self._on_ball_lost)
	self._play_area.level_cleared.connect(self._on_level_cleared)
	# Fine before the play area knows its real size: level scenes place their own bricks,
	# and the play area re-centres the paddle once the size arrives.
	self.reset_game()


func reset_game() -> void:
	# Assigning through the setters shows the values in the column.
	self._score_total = 0
	self._lives = self.starting_lives
	self._level = self.starting_level
	self._load_current_level()


func _set_state(new_state: State) -> void:
	self._state = new_state
	var is_game_over: bool = new_state == State.GAME_OVER
	self.get_tree().paused = is_game_over
	self._game_over_overlay.visible = is_game_over


func _unhandled_input(event: InputEvent) -> void:
	# The only place launch is read: the state decides what the press means, so one press does one thing.
	if not event.is_action_pressed("launch"):
		return
	match self._state:
		State.GAME_OVER:
			self.reset_game()
			self._set_state(State.PLAYING)
		State.PLAYING:
			self._play_area.launch_ball()


func _on_points_scored(points: int) -> void:
	self._score_total += points


func _on_level_cleared() -> void:
	# Score and lives carry over.
	self._level += 1
	self._load_current_level()


func _on_ball_lost() -> void:
	if self._lives > 0:
		self._lives -= 1
		self._play_area.reset_ball_and_paddle()
	else:
		self._set_state(State.GAME_OVER)


func _load_current_level() -> void:
	# Wrap past the last scene: level 3 is level 1's wall again, while the label keeps counting.
	self._play_area.load_level(self.levels[(self._level - 1) % self.levels.size()])
