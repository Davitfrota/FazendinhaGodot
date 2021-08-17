extends Node2D

var vacaSound = preload("res://Assets/Audios/Vaquita1.wav")
var cobraSound = preload("res://Assets/Audios/snk.wav")
var leaoSound = preload("res://Assets/Audios/Leao.wav")
var bodeSound = preload("res://Assets/Audios/Cabrita.wav")
var golfSound = preload("res://Assets/Audios/Golfinho.wav")
var birdSound = preload("res://Assets/Audios/Papagaio (1).wav")


func _ready():
	$ColorRect.visible = true
	$AnimationPlayer.play("Entrando")
	

func _on_Button_pressed():
	$AudioStreamPlayer.stream = vacaSound
	$AudioStreamPlayer.play()

func _on_Button2_pressed():
	$AudioStreamPlayer.stream = leaoSound
	$AudioStreamPlayer.play()


func _on_Button3_pressed():
	$AudioStreamPlayer.stream = bodeSound
	$AudioStreamPlayer.play()


func _on_Button4_pressed():
	$AudioStreamPlayer.stream = golfSound
	$AudioStreamPlayer.play()


func _on_Button5_pressed():
	$AudioStreamPlayer.stream = birdSound
	$AudioStreamPlayer.play()


func _on_Button6_pressed():
	$AudioStreamPlayer.stream = cobraSound
	$AudioStreamPlayer.play()


func _on_Button7_pressed():
	get_tree().change_scene("res://MenuGames.tscn")
