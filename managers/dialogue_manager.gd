extends Node

#region Enums
#endregion

#region Parameters (consts and exportvars)
@onready var text_box_scene : PackedScene = preload("res://views/text_box.tscn")
#endregion

#region Signals
#endregion

#region Variables
var dialogue_lines : Array[String] = []
var line_index = 0

var player_controller : PlayerController
var text_box : TextBoxView
var text_origin : Vector2

var is_dialogue_active : bool
var is_following_player : bool
var can_advance_line : bool
#endregion

#region Computed properties
#endregion

#region Event functions
func _init():
	pass
	
func _enter_tree():
	pass
	
func _ready():
	pass
	
func _process(_delta):
	if is_dialogue_active and is_following_player:
		_follow_player()
		
func _physics_process(_delta):
	pass

func _input(event):
	if event.is_action_pressed("click_left") and is_dialogue_active and can_advance_line:
		_advance_text()
		
#endregion

#region Public functions
func set_player_controller(pc : PlayerController):
	player_controller = pc
	
func start_dialogue(lines: Array[String], follow_player := true, origin := Vector2(0,0)):
	# Can't start dialogue if another is active
	if is_dialogue_active:
		print("Another dialogue is active!")
		return
	if !lines or lines.size() == 0:
		return
	
	dialogue_lines = lines
	line_index = 0
	is_following_player = follow_player
	text_origin = origin
	is_dialogue_active = true
	_show_current_text_box()
#endregion

#region Private functions
func _advance_text():
	_clear_existing_text_box()
	line_index += 1
	if line_index >= dialogue_lines.size():
		is_dialogue_active = false
		return
	_show_current_text_box()
	
func _clear_existing_text_box():
	if text_box:
		text_box.queue_free()
	
func _follow_player():
	if text_box and player_controller:
		text_box.set_anchor_position(player_controller.global_position)
	
func _on_finished_displaying():
	can_advance_line = true
	
func _show_current_text_box():
	text_box = text_box_scene.instantiate()
	text_box.finished_displaying.connect(_on_finished_displaying)
	get_tree().root.add_child.call_deferred(text_box)
	
	# Adjust position
	if(is_following_player):
		_follow_player()
	else: text_box.set_anchor_position(text_origin)
	
	text_box.display_text(dialogue_lines[line_index])
	can_advance_line = false
#endregion

#region Subclasses
#endregion


