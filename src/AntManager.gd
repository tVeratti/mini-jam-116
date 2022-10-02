extends Node

const AntScene = preload("res://Ant/Ant.tscn")


var current_id:int = -1
var ants:Dictionary = {}


func _ready():
	pass


func add() -> Node2D:
	current_id += 1
	
	var ant = AntScene.instantiate()
	var id = "ant_%s" % current_id
	ant.id = id
	ants[id] = ant
	
	return ant


func any_ants_moving() -> bool:
	for ant in ants.values():
		if ant.is_moving: return true
	
	return false


func _resolve_ant_movement():
	for ant in ants.values():
		pass
