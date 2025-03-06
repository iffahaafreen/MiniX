class_name PlayerStateMachine extends Node

var states: Array[State]
var prev_state:State
var cur_state:State

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode=Node.PROCESS_MODE_DISABLED
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ChangeState(cur_state.Process(delta))
	pass

func _physics_process(delta: float) -> void:
	ChangeState(cur_state.Physics(delta))
	pass

func _unhandled_input(event: InputEvent) -> void:
	ChangeState(cur_state.HandleInput(event))
	pass

func Initialize(_player : Player) ->void:
	states = []
	for c in get_children():
		if c is State:
			states.append(c)
	
	if states.size() == 0:
		return
	
	states [0].player = _player
	states[0].state_machine = self
	
	for state in states:
		state.init()
	
	ChangeState(states[0])
	process_mode = Node.PROCESS_MODE_INHERIT

func ChangeState(new_state:State) -> void:
	if new_state == null || new_state == cur_state:
		return
	if cur_state:
		cur_state.Exit()
	prev_state=cur_state
	cur_state=new_state
	cur_state.Enter()
