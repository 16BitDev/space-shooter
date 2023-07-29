extends CharacterBody2D

var speed : float = 50
var direction : Vector2 = Vector2.DOWN

func _ready():
	velocity = direction * speed 

func _physics_process(delta):
	var col = move_and_collide(velocity * delta)
	
	if col:
		velocity = velocity.bounce(col.get_normal())
