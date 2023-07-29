extends Node2D

@onready var wave_timer = $WaveTimer
@onready var wave_number = $WaveNumber
@export var enemy_node: PackedScene

var wave: int = 1:
	set(value):
		wave = value
		wave_number.text = "wave : " + str(value)

func _ready():
	randomize()
	spawn()

func _on_wave_timer_timeout():
	wave += 1
	spawn()

func spawn():
	var enemy = enemy_node.instantiate()
	
	enemy.position = Vector2(randf_range(0,128),-8)
	enemy.speed = min ( wave * 25, 125 )
	enemy.tree_exited.connect(spawn)
	
	if wave >= 5:
		enemy.direction = Vector2(1,1).normalized()
	
	call_deferred("add_child",enemy)
