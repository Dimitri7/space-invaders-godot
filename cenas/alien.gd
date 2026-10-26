extends CharacterBody2D

var Missil = preload("res://cenas/missil.tscn")
@onready var time_movimento = $timerMovimento
@onready var animation_alien = $AnimationPlayer
@onready var spawn_point = $spawnPoint

var origen = 0
var distancia = 10
var passo = 7
var direction = 1

signal alien_eliminado(alien)

func _ready():
	time_movimento.start()
	origen = self.position.x

func _on_timer_movimento_timeout():
	#print(self.position.x)
	self.position.x += direction * passo
	if self.position.x >= origen + distancia or self.position.x <= origen - distancia:
		direction *= -1

func explosion():
	$CollisionShape2D.set_deferred("disabled", true)
	$AnimationPlayer.play("destroy")
	$AudioStreamPlayer2D.play()
	

func _on_animation_player_animation_finished(anim_name):
	emit_signal("alien_eliminado",self)
	if anim_name == "destroy":
		queue_free()
		
func disparar():
	var missil = Missil.instantiate()
	missil.global_position = spawn_point.global_position
	get_parent().add_child(missil)
