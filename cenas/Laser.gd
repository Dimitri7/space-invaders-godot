extends Area2D

var velocity = 200
var dano_do_laser = 1 

func _process(delta):
	position.y -= velocity * delta

func _on_body_entered(body):
	if body.is_in_group("aliens"):
		body.explosion() 
		queue_free()
		
	elif body.is_in_group("blocos"):
		body.destruir()
		queue_free()
		if !is_queued_for_deletion():
			get_parent().remove_child(self)
			queue_free()
			
	elif body.is_in_group("chefao"):
		body.tomar_dano(dano_do_laser) 
		queue_free()
