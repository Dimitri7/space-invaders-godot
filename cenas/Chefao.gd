extends CharacterBody2D

@export var tiro_chefe_scn: PackedScene
@onready var barra_de_vida = $StatusChefe/BarraDeVida

var vida = 200
var velocidade = 60.0  
var direcao = 1         
var tamanho_tela




func _ready():
	tamanho_tela = get_viewport_rect().size
	position.x = tamanho_tela.x / 2
	position.y = 100
	barra_de_vida.max_value = vida
	barra_de_vida.value = vida

func _physics_process(delta):
	velocity.x = velocidade * direcao
	
	move_and_slide()
	
	if position.x > tamanho_tela.x or position.x < 0:
		direcao *= -1
		position.x = clamp(position.x, 0, tamanho_tela.x)
		
func _on_timer_timeout():
	var novo_tiro = tiro_chefe_scn.instantiate()
	get_parent().add_child(novo_tiro)
	
	novo_tiro.global_position = global_position

func tomar_dano(dano):
	vida -= dano
	print("Vida do chefe: ", vida)
	barra_de_vida.value = vida
	if vida <= 0:
		print("Chefe derrotado!")
		get_tree().change_scene_to_file("res://cenas/menu.tscn")
		queue_free()



