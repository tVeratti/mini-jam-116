extends Node

signal on_input_phase_start()
signal on_input_phase_end()
signal on_resolve_phase_start()
signal on_resolve_phase_end()

enum Phases { INPUT, RESOLVE }

var turn_count:int = 0
var phase:Phases = Phases.INPUT


func _process(delta):
	match(phase):
		Phases.INPUT:
			if Input.is_action_just_pressed("ui_accept"):
				end_input()
		Phases.RESOLVE:
			if not AntManager.any_ants_moving():
				end_resolve()


func end_input() -> void:
	phase = Phases.RESOLVE
	on_input_phase_end.emit()
	on_resolve_phase_start.emit()


func end_resolve() -> void:
	phase = Phases.INPUT
	turn_count += 1
	on_resolve_phase_end.emit()
	on_input_phase_start.emit()
