extends HBoxContainer

enum State { PLAYING, GAME_OVER }

# Spare balls: the one in play isn't counted, so 2 means three balls in total.
@export var starting_lives: int = 2
@export var starting_level: int = 1

var _state: State = State.PLAYING
var _score_total: int = 0:
	set(value):
		_score_total = value
		# The setter can run before the child nodes exist (while the scene loads).
		if self.is_node_ready():
			self._game_state_window.set_score(_score_total)
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


func _ready() -> void:
	self._play_area.points_scored.connect(self._on_points_scored)
	self._play_area.ball_lost.connect(self._on_ball_lost)
	# Assigning through the setters shows the starting values in the column.
	# Not reset_game(): the play area builds its own first wall once its real size arrives.
	self._score_total = 0
	self._lives = self.starting_lives
	self._level = self.starting_level


func reset_game() -> void:
	self._score_total = 0
	self._lives = self.starting_lives
	self._level = self.starting_level
	self._play_area.build_level()


func _set_state(new_state: State) -> void:
	self._state = new_state


func _on_points_scored(points: int) -> void:
	self._score_total += points


func _on_ball_lost() -> void:
	if self._lives > 0:
		self._lives -= 1
		self._play_area.reset_ball_and_paddle()
	else:
		self._set_state(State.GAME_OVER)
		self.reset_game()
		self._set_state(State.PLAYING)
