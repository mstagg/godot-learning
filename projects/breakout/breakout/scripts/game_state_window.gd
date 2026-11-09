class_name GameStateWindow
extends Control

@onready var _score_label: Label = $MarginContainer/VBoxContainer/ScoreLabel
@onready var _lives_label: Label = $MarginContainer/VBoxContainer/LivesLabel
@onready var _level_label: Label = $MarginContainer/VBoxContainer/LevelLabel


func set_score(score: int) -> void:
	# %05d pads with zeros to 5 digits: 10 becomes "00010".
	self._score_label.text = "%05d" % score


func set_lives(lives: int) -> void:
	self._lives_label.text = "Extra Lives: %d" % lives


func set_level(level: int) -> void:
	self._level_label.text = "Level %d" % level
