extends MarginContainer
class_name TextBoxView

#region Enums
#endregion

#region Parameters (consts and exportvars)
const letter_time = 0.03
const space_time_modifier = 2
const punctuation_time_modifier = 6.5
const max_width = 256
const y_offset = -500

#endregion

#region Signals
signal finished_displaying()
#endregion

#region Variables
@onready var label : Label = %TextLabel
@onready var letter_timer : Timer = %LetterDisplayTimer
var current_text = ""
var letter_index = 0
#endregion

#region Computed properties
#endregion

#region Event functions
func _init():
	pass
	
func _enter_tree():
	pass
	
func _ready():
	_reset_text()
	letter_timer.timeout.connect(_recursive_text_animation)
	
func _process(_delta):
	pass
	
func _physics_process(_delta):
	pass
#endregion

#region Public functions
func display_text(text_to_display : String):
	await ready
	current_text = text_to_display
	#await _adjust_text_size()	
	#_ajust_position()
	_reset_text()
	_recursive_text_animation()
	
func set_anchor_position(position : Vector2):
	var middle_offset := Vector2(-size.x/2,size.y)
	var new_global_pos := position + middle_offset + Vector2(0.0,y_offset)
	if global_position != new_global_pos:
		global_position = new_global_pos
	
#endregion

#region Private functions
func _adjust_position():
	global_position -= Vector2(size.x/2,size.y+24)
	
func _adjust_text_size(text_to_display : String):
	label.text = text_to_display
	# Await for the check on resizing
	await resized
	custom_minimum_size.x = min(size.x, max_width)
	if size.x > max_width:
		label.autowrap_mode = TextServer.AUTOWRAP_WORD
		await resized # wait for x resize
		await resized # wait for y resize
		custom_minimum_size.y = size.y

func _display_next_letter():
	label.text += current_text[letter_index]
	letter_index += 1
	
func _get_character_time(char: String) -> float:
	var modifier := 1.0
	match char:
		"!",".",",","?":
			modifier = punctuation_time_modifier
		" ":
			modifier = space_time_modifier
	return letter_time*modifier
	
func _recursive_text_animation():
	_display_next_letter()
	# No more characters do display
	if letter_index >= current_text.length():
		finished_displaying.emit()
		return
	# Still characters to display
	letter_timer.start(_get_character_time(current_text[letter_index]))
		

func _reset_text():
	label.text = ""
	letter_index = 0
	
	
#endregion

#region Subclasses
#endregion


