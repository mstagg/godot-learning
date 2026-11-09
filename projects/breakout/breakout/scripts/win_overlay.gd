class_name WinOverlay
extends CanvasLayer

@onready var _score_label: Label = $CenterContainer/VBoxContainer/ScoreLabel


func set_score(score: int) -> void:
	self._score_label.text = "SCORE %05d" % score
