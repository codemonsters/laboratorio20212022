extends Node
class_name ControllersManager

var _controllers: Array # of Controllers
var _main_controller: Controller	# Controlador principal (el que maneja la UI)
var _main_node: Node2D


func _init(main_node: Node2D):
	_main_node = main_node
	_controllers = []


func input(event: InputEvent):
	for controller in _controllers:
		if controller.get_class() == ("KeyboardController"):
			controller.input(event)


func add_controller(controller: Controller):
	_controllers.append(controller)
	print_debug("New controller added: " + controller.to_string())


#func handle_input(event):
#	for controller in _controllers:
#		if controller.input(event):
#			# get_tree().set_input_as_handled()
#			break
#			# Set input as handled no funciona. Mirarlo


func controller_input(controller: Controller, action: String):
	if _main_controller == null:
		_main_controller = controller

	if controller.get_instance_id() != _main_controller.get_instance_id():
		_main_node.get_node("CurrentScene").get_child(0).controller_input(controller, action, false)
	else:
		_main_node.get_node("CurrentScene").get_child(0).controller_input(controller, action, true)
