extends Sprite2D
class_name ClickableController

#region Enums
#endregion

#region Parameters (consts and exportvars)
@export var outline_shader_material : ShaderMaterial
@export var dialogues : Array[String]
@export var item : Item
@export var disappear_on_click : bool
@export var has_collision : bool
#endregion

#region Signals
signal destroyed()
#endregion

#region Variables
@onready var clickable_area : Area2D = %ClickableArea
#endregion

#region Computed properties
var has_item : bool:
	get: return item != null
#endregion

#region Event functions
func _init():
	pass
	
func _enter_tree():
	pass
	
func _ready():
	# Setup area events
	clickable_area.input_event.connect(_area_input_event)
	clickable_area.mouse_entered.connect(_area_mouse_entered)
	clickable_area.mouse_exited.connect(_area_mouse_exited)
	_setup_shapes_2d()
	
func _process(_delta):
	pass
	
func _physics_process(_delta):
	pass
#endregion

#region Public functions
#endregion

#region Private functions
func _area_input_event(viewport: Node, event: InputEvent, shape_idx: int):
	if event.is_action_pressed("click_left"):
		if dialogues and dialogues.size()>0:
			DialogueManager.start_dialogue(dialogues)
		if has_item:
			GameManager.add_item(item)
		if disappear_on_click:
			destroyed.emit()
			queue_free()

func _area_mouse_entered():
	material = outline_shader_material
	
func _area_mouse_exited():
	material = null
	
func _setup_shapes_2d():
	var texture_size := texture.get_size()
	# Click collision
	var capsule_shape := CapsuleShape2D.new()
	capsule_shape.height = texture_size.y
	capsule_shape.radius = texture_size.x/2
	%AreaCollision.shape = capsule_shape
	# Body collision
	if has_collision:
		var circle_shape := CircleShape2D.new()
		circle_shape.radius = texture_size.x/2
		var collision_offset = Vector2(0,texture_size.y/2)
		%StaticBodyCollision.shape = circle_shape
		%StaticBodyCollision.position -= collision_offset
#endregion

#region Subclasses
#endregion


