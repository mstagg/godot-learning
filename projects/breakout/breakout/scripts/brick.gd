@tool
class_name Brick
extends StaticBody2D

signal destroyed(points: int)

@export var size: Vector2 = Vector2(96.0, 24.0):
	set(value):
		# Plain `size`, not `self.size`: Godot makes `self.size` a compile error inside its own setter.
		size = value
		self._apply_size()
@export var points: int = 10

@onready var _shape: CollisionShape2D = $CollisionShape2D
@onready var _art: PixelNinePatch = $Art


func _ready() -> void:
	self._apply_size()


func hit() -> void:
	self.destroyed.emit(self.points)
	self.queue_free()


func _apply_size() -> void:
	# The setter can run before the child nodes exist (while the scene loads).
	if not self.is_node_ready():
		return
	(self._shape.shape as RectangleShape2D).size = self.size
	self._art.fit(self.size)
