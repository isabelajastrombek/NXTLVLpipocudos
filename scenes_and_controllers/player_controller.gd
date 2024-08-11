extends CharacterBody2D
class_name PlayerController

@export var speed = 300
@export var distance_threshold = 10
var target_position = Vector2()
var direction = Vector2()
@onready var animation_player = $AnimationPlayer

signal moved(to : Vector2)

func force_set_position(new_pos: Vector2):
	position = new_pos
	target_position = new_pos

func _ready():
	target_position = position
	DialogueManager.set_player_controller(self)
	
func _physics_process(_delta):
	if !DialogueManager.is_dialogue_active and Input.is_action_pressed("click_left"):
		target_position = get_global_mouse_position()
	_move_to_target()
	
func _move_to_target():
	if position.distance_to(target_position) > distance_threshold:
		direction = (target_position - position).normalized()
		velocity = direction * speed
		move_and_slide()
		moved.emit(target_position)
		animation_player.play("player_walk")
		if position.x > target_position.x:
			$Sprite2D.flip_h = false
		elif position.x < target_position.x:
			$Sprite2D.flip_h = true
	else:
		animation_player.play("player_idle")
