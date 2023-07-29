extends Area2D

var direction : Vector2 = Vector2.UP
var speed : float = 300

func _physics_process(delta):
	position += direction * speed * delta

func _on_exited():
	queue_free()


func _on_body_entered(body):
	body.queue_free()
