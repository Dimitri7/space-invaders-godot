extends Area2D

var velocidade = 250

func _physics_process(delta):
	position.y += velocidade * delta
	if position.y > get_viewport_rect().size.y + 50:
		queue_free()


func _on_body_entered(body):
	if body.is_in_group("tanque"):
		get_tree().change_scene_to_file("res://cenas/game_over.tscn")
		queue_free() 
