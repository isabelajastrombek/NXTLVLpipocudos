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

var node_to_follow : Node2D
var text_box : TextBoxView

var is_dialogue_active : bool
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
	if is_dialogue_active and node_to_follow:
		_follow_node()
		
func _physics_process(_delta):
	pass

func _input(event):
	if event.is_action_pressed("click_right") and is_dialogue_active and can_advance_line:
		_advance_text()
		
#endregion

#region Public functions
func start_dialogue(follow_node: Node2D, lines: Array[String]):
	# Can't start dialogue if another is active
	if is_dialogue_active:
		print("Another dialogue is active!")
		return
	
	dialogue_lines = lines
	line_index = 0
	node_to_follow = follow_node
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
	
func _follow_node():
	if text_box:
		text_box.set_anchor_position(node_to_follow.global_position)
	
func _on_finished_displaying():
	can_advance_line = true
	
func _show_current_text_box():
	text_box = text_box_scene.instantiate()
	text_box.finished_displaying.connect(_on_finished_displaying)
	get_tree().root.add_child.call_deferred(text_box)
	_follow_node()
	text_box.display_text(dialogue_lines[line_index])
	can_advance_line = false
#endregion

#region Subclasses
#endregion


