extends Sprite2D
class_name ClickableController

#region Enums
#endregion

#region Parameters (consts and exportvars)
@export var outline_shader_material : ShaderMaterial
@export var dialogues : Array[String]
@export var item : Item
#endregion

#region Signals
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
	_setup_shape_2d()
	
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
		if has_item:
			GameManager.add_item(item)
			queue_free()
		else: DialogueManager.start_dialogue(dialogues)

func _area_mouse_entered():
	material = outline_shader_material
	
func _area_mouse_exited():
	material = null
	
func _setup_shape_2d():
	var texture_size := texture.get_size()
	var capsule_shape := CapsuleShape2D.new()
	capsule_shape.height = texture_size.y
	capsule_shape.radius = texture_size.x/2
	%AreaCollision.shape = capsule_shape
	%StaticBodyCollision.shape = capsule_shape
#endregion

#region Subclasses
#endregion


