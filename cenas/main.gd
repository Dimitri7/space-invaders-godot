extends Node

var pontos = 0
var chefe_iniciado = false 
@onready var label_pontos = $VBoxContainer/LabelPontos

func _verificar_pontos_para_chefe():
	if pontos >= 3000 and not chefe_iniciado:
		print("Pontuação máxima atingida! Chamando o chefão!")
		get_tree().change_scene_to_file("res://cenas/cena_chefao.tscn")

func Somar_pontos_alien(a):
	pontos += 100
	label_pontos.text = str(pontos)
	_verificar_pontos_para_chefe() 

func somar_bonus():
	pontos += 500
	label_pontos.text = str(pontos)
	_verificar_pontos_para_chefe() 
