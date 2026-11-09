class_name Level
extends Node2D

signal points_scored(points: int)
signal cleared

var _bricks_left: int = 0


func _ready() -> void:
	# Count the bricks placed in this level's scene, and listen to each one.
	for child: Node in self.get_children():
		var brick: Brick = child as Brick
		if brick:
			brick.destroyed.connect(self._on_brick_destroyed)
			self._bricks_left += 1


func _on_brick_destroyed(points: int) -> void:
	self.points_scored.emit(points)
	self._bricks_left -= 1
	if self._bricks_left == 0:
		# Deferred: the last hit happens mid physics step, and the next level adds bricks, which can't happen mid-step.
		self.cleared.emit.call_deferred()
