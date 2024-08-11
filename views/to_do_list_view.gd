extends Control
class_name ToDoListView

@onready var item_list = %ItemList

# nome da task, quantos já realizados, quantos precisa realizar, ordem na lista, se ja foi "descoberto"
var tasks = [{"task": "Varrer o chão", "doing": 0, "to_do": 4, "id": -1, "not_discovered" : true}, {"task": "Recolher lixo", "doing": 0, "to_do": 6, "id": -1, "not_discovered" : true}, {"task": "Lavar louça", "doing": 0, "to_do": 3, "id": -1, "not_discovered" : true}]

func _ready():
	pass
	#_on_button_achar_1_pressed()
	#_on_button_achar_2_pressed()
	#_on_button_achar_3_pressed()

func _add_task(index):
	item_list.add_item("(?/?) %s" % tasks[index]["task"])
	if !visible:
		show()
	
func _find_task(index):
	pass

func _on_button_achar_1_pressed():
	#tasks[0]["id"] = current_tasks_discovered
	_add_task(0)
	#print(current_tasks_discovered)
	#current_tasks_discovered += 1
	#$Teste/ButtonAchar1.hide()
	#$Teste/ButtonFazer1.text = "Varrer!"
	#$Teste/ButtonFazer1.show()
	
	
func _on_button_fazer_1_pressed():
	if tasks[0]["doing"] < tasks[0]["to_do"]:
		tasks[0]["doing"] += 1
		
	item_list.set_item_text(tasks[0]["id"], "(%d/%d) %s" % [tasks[0]["doing"], tasks[0]["to_do"], tasks[0]["task"]])
	if tasks[0]["doing"] == tasks[0]["to_do"]:
		$Teste/ButtonFazer1.hide()
		item_list.set_item_disabled(tasks[0]["id"], true)
	


func _on_button_achar_2_pressed(): pass
	#tasks[1]["id"] = current_tasks_discovered
	#_add_task(1)
	#print(current_tasks_discovered)
	#current_tasks_discovered += 1
	#$Teste/ButtonAchar2.hide()
	#$Teste/ButtonFazer2.text = "Recolher!"
	#$Teste/ButtonFazer2.show()


func _on_button_fazer_2_pressed():
	if tasks[1]["doing"] < tasks[1]["to_do"]:
		tasks[1]["doing"] += 1
		
	item_list.set_item_text(tasks[1]["id"], "(%d/%d) %s" % [tasks[1]["doing"], tasks[1]["to_do"], tasks[1]["task"]])
	if tasks[1]["doing"] == tasks[1]["to_do"]:
		$Teste/ButtonFazer2.hide()
		item_list.set_item_disabled(tasks[1]["id"], true)


func _on_button_achar_3_pressed(): pass
	#tasks[2]["id"] = current_tasks_discovered
	#_add_task(2)
	#print(current_tasks_discovered)
	#current_tasks_discovered += 1
	#$Teste/ButtonAchar3.hide()
	#$Teste/ButtonFazer3.text = "Lavar!"
	#$Teste/ButtonFazer3.show()


func _on_button_fazer_3_pressed():
	if tasks[2]["doing"] < tasks[2]["to_do"]:
		tasks[2]["doing"] += 1
		
	item_list.set_item_text(tasks[2]["id"], "(%d/%d) %s" % [tasks[2]["doing"], tasks[2]["to_do"], tasks[2]["task"]])
	if tasks[2]["doing"] == tasks[2]["to_do"]:
		$Teste/ButtonFazer3.hide()
		item_list.set_item_disabled(tasks[2]["id"], true)
