class_name PixelNinePatch
extends NinePatchRect

# A const, not an @export: an export could be overridden per scene, and the point is one value for all art.
const ART_SCALE: float = 2.0


func fit(target_size: Vector2) -> void:
	# Patch margins are in texture pixels, so draw at 1/ART_SCALE size and scale up: each art pixel becomes ART_SCALE screen pixels.
	self.size = target_size / ART_SCALE
	self.scale = Vector2(ART_SCALE, ART_SCALE)
	# A Control grows from its top-left corner; the parent body's origin is its centre.
	self.position = -target_size / 2.0
