extends CharacterBody2D

@export var speed = 300
@export var distance_threshold = 10
var target_position = Vector2()
var direction = Vector2()
@onready var animation_player = $AnimationPlayer

func _ready():
	target_position = position
	
func _physics_process(delta):
	if Input.is_action_just_pressed("click_left"):
		target_position = get_global_mouse_position()
		
	if position.distance_to(target_position) > distance_threshold:
		direction = (target_position - position).normalized()
		velocity = direction * speed
		move_and_slide()
		animation_player.play("player_walk")
		if position.x > target_position.x:
			$Sprite2D.flip_h = false
		elif position.x < target_position.x:
			$Sprite2D.flip_h = true
	else:
		animation_player.play("player_idle")
