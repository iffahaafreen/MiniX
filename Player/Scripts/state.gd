class_name State extends Node

static var player : Player
static var state_machine : PlayerStateMachine

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func init() -> void:
	pass
#What happens when player enters the state
func Enter() -> void:
	pass

#What happens when player exits the state
func Exit() -> void:
	pass

func Process(_delta:float) -> State:
	return null

func Physics(_delta:float) -> State:
	return null

func HandleInput(_event: InputEvent) -> State:
	return null
