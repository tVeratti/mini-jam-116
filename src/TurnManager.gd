extends Node

signal on_input_phase_start()
signal on_input_phase_end()
signal on_resolve_phase_start()
signal on_resolve_phase_end()

enum Phases { INPUT, RESOLVE }

var turn_count:int = 0
var phase:Phases = Phases.INPUT


func next() -> void:
	match(phase):
		Phases.INPUT:
			on_resolve_phase_start.emit()
		Phases.RESOLVE:
			turn_count += 1
			on_input_phase_start.emit()
	


func end_input() -> void:
	on_input_phase_end.emit()


func end_resolve() -> void:
	on_resolve_phase_end.emit()
