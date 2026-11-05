class_name Brick
extends StaticBody2D

@export var size: Vector2 = Vector2(96.0, 24.0):
	set(value):
		# Plain `size`, not `self.size`: Godot makes `self.size` a compile error inside its own setter.
		size = value
		self._apply_size()
@export var border_width: float = 2.0:
	set(value):
		border_width = value
		self._apply_size()

@onready var _shape: CollisionShape2D = $CollisionShape2D
@onready var _border: ColorRect = $Border
@onready var _fill: ColorRect = $Fill


func _ready() -> void:
	self._apply_size()


func hit() -> void:
	self.queue_free()


func _apply_size() -> void:
	# The setter can run before the child nodes exist (while the scene loads).
	if not self.is_node_ready():
		return
	(self._shape.shape as RectangleShape2D).size = self.size
	self._border.size = self.size
	self._border.position = -self.size / 2.0
	# The fill sits on top of the border, inset on every side so the border shows around it.
	self._fill.size = self.size - Vector2(self.border_width, self.border_width) * 2.0
	self._fill.position = -self.size / 2.0 + Vector2(self.border_width, self.border_width)
