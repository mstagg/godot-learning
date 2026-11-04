class_name Drain
extends Area2D

signal ball_drained

@export var size: Vector2 = Vector2(10.0, 10.0):
	set(value):
		# Plain `size`, not `self.size`: Godot makes `self.size` a compile error inside its own setter.
		size = value
		self._apply_size()

@onready var _shape: CollisionShape2D = $CollisionShape2D


func _ready() -> void:
	self._apply_size()
	self.body_entered.connect(self._on_body_entered)


func _on_body_entered(_body: Node2D) -> void:
	# The Mask only has "ball" ticked, so anything that enters is the ball.
	self.ball_drained.emit()


func _apply_size() -> void:
	# The setter can run before the child nodes exist (while the scene loads).
	if not self.is_node_ready():
		return
	(self._shape.shape as RectangleShape2D).size = self.size
