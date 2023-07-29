extends Area2D

@onready var life_counter = $LifeCounter

var life: int = 3:
	set(value):
		life = value
		if value <= 0:
			get_tree().reload_current_scene()
		life_counter.text = "life : " + str(value)



func _on_body_entered(body):
	body.queue_free()
	life -= 1
