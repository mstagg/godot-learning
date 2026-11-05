extends HBoxContainer

var _score_total: int = 0:
	set(value):
		_score_total = value
		# The setter can run before the child nodes exist (while the scene loads).
		if self.is_node_ready():
			self._game_state_window.set_score(_score_total)

@onready var _play_area: GameWindow = $GameWindow/SubViewport/PlayArea
@onready var _game_state_window: GameStateWindow = $GameStateWindow


func _ready() -> void:
	self._play_area.points_scored.connect(self._on_points_scored)
	# Assigning through the setter shows the starting score in the column.
	self._score_total = 0


func _on_points_scored(points: int) -> void:
	self._score_total += points
