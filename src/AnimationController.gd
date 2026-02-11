class_name AnimationController
extends AnimatedSprite2D

@export var character_controller : CharacterMovement

const ANIM_IDLE = "idle"
const ANIM_RUN = "run"

var color_damage = Color(1, 0, 0, 0.5)
var color_normal = Color(1, 1, 1, 1)

func _ready() -> void:
	animation_finished.connect(_on_animation_finished)

func _process(_delta: float) -> void:
	var velocity : Vector2 = character_controller.velocity
	
	if velocity.x != 0:
		flip_h = velocity.x < 0
	
	if velocity.length() > 0:
		if animation != ANIM_RUN: play(ANIM_RUN)
	else:
		if animation != ANIM_IDLE: play(ANIM_IDLE)

func _on_damage_taken(_amount: int) -> void:
	var flash_tween = get_tree().create_tween()
	flash_tween.tween_property(self, "self_modulate", color_damage, 0.1)
	flash_tween.tween_property(self, "self_modulate", color_normal, 0.1)

func _on_animation_finished() -> void:
	if animation != ANIM_IDLE:
		play(ANIM_IDLE)
