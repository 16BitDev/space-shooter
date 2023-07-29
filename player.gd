extends CharacterBody2D

@export var bullet_node : PackedScene
@onready var timer = $Timer

func _physics_process(_delta):
	velocity = Input.get_vector("ui_left",
								"ui_right",
								"ui_up",
								"ui_down").normalized() * 150
	move_and_slide()

func _input(event):
	if event.is_action_pressed("shoot"):
		_shoot()
		timer.start()
	elif event.is_action_released("shoot"):
		timer.stop()

func _shoot():
	var bullet = bullet_node.instantiate()
	bullet.position = position
	get_tree().current_scene.add_child(bullet)


func _on_timer_timeout():
	_shoot()
