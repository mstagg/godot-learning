class_name Brick
extends StaticBody2D

@export var size: Vector2 = Vector2(80.0, 24.0):
	set(value):
		# Plain `size`, not `self.size`: Godot makes `self.size` a compile error inside its own setter.
		size = value
		self._apply_size()

@onready var _shape: CollisionShape2D = $CollisionShape2D
@onready var _visual: ColorRect = $ColorRect


func _ready() -> void:
	self._apply_size()


func hit() -> void:
	self.queue_free()


func _apply_size() -> void:
	# The setter can run before the child nodes exist (while the scene loads).
	if not self.is_node_ready():
		return
	(self._shape.shape as RectangleShape2D).size = self.size
	self._visual.size = self.size
	self._visual.position = -self.size / 2.0
