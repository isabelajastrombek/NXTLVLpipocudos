class_name Task
extends Resource

#region Enums
#endregion

#region Variables
@export var name : String
@export var to_do : int
var discovered := false
var doing := 0
#endregion

#region Computed properties
#endregion

func _init():
	pass

#region Public functions
func discover():
	discovered = true
	
func increase_doing():
	doing += 1
#endregion

#region Subclasses
#endregion


