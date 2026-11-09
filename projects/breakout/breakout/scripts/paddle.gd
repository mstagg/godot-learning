class_name Paddle
extends CharacterBody2D

@export var size: Vector2 = Vector2(140.0, 20.0):
	set(value):
		# Plain `size`, not `self.size`: Godot makes `self.size` a compile error inside its own setter.
		size = value
		self._apply_size()
@export var speed: float = 800.0
# How much a full-speed paddle bends the ball: sideways units added per unit of direction. 0 = pure mirror bounce.
@export var paddle_influence: float = 0.5
# The furthest the ball may lean away from the surface it left (straight up, for the top face).
@export var max_angle_deg: float = 60.0

# The ball sitting on the paddle, or null when it's in play.
var _held_ball: Ball = null

@onready var _shape: CollisionShape2D = $CollisionShape2D
@onready var _art: PixelNinePatch = $Art


func _ready() -> void:
	self._apply_size()


func _physics_process(_delta_sec: float) -> void:
	var direction: float = Input.get_axis("paddle_left", "paddle_right")
	self.velocity.x = direction * self.speed
	self.move_and_slide()

	var half_width: float = self.size.x / 2.0
	self.position.x = clampf(self.position.x, half_width, self.get_viewport_rect().size.x - half_width)

	if self._held_ball:
		# After the clamp, so the ball follows where the paddle really ended up.
		self._place_held_ball()


# Does nothing when the ball is already in play, so callers needn't check.
func launch_held_ball() -> void:
	if not self._held_ball:
		return
	# Launching acts like a hit on the top face: start straight up, facing straight up.
	self._held_ball.launch(self.aim(Vector2.UP, Vector2.UP))
	self._held_ball = null


# ball_direction: where the ball would go without the paddle's push (only its direction matters).
# surface_normal: the direction the hit surface faces (straight up for the paddle's top).
func aim(ball_direction: Vector2, surface_normal: Vector2) -> Vector2:
	# Real velocity, not the requested one: pushing against a wall measures 0, so it adds nothing.
	var push: Vector2 = self.get_real_velocity() / self.speed * self.paddle_influence
	var aimed: Vector2 = (ball_direction.normalized() + push).normalized()
	# Keep it inside a fan of max_angle_deg either side of the direction the hit surface faces.
	var max_angle: float = deg_to_rad(self.max_angle_deg)
	var angle: float = clampf(surface_normal.angle_to(aimed), -max_angle, max_angle)
	return surface_normal.rotated(angle)


func hold_ball(ball: Ball) -> void:
	self._held_ball = ball
	ball.pause_physics()
	# Place it now, not next frame, so a ball that just drained doesn't linger at the bottom.
	self._place_held_ball()


func _place_held_ball() -> void:
	# Centre x, resting on the top edge: up by half the paddle's height plus the ball's radius.
	var top_y: float = self.global_position.y - self.size.y / 2.0
	self._held_ball.global_position = Vector2(self.global_position.x, top_y - self._held_ball.radius)


func _apply_size() -> void:
	# The setter can run before the child nodes exist (while the scene loads).
	if not self.is_node_ready():
		return
	(self._shape.shape as RectangleShape2D).size = self.size
	self._art.fit(self.size)
