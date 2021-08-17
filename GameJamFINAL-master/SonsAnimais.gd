extends Node2D


var vacaSound = preload("res://Assets/Audios/Vaquita1.wav")
var cobraSound = preload("res://Assets/Audios/snk.wav")
var leaoSound = preload("res://Assets/Audios/Leao.wav")
var bodeSound = preload("res://Assets/Audios/Cabrita.wav")
var golfSound = preload("res://Assets/Audios/Golfinho.wav")
var birdSound = preload("res://Assets/Audios/Papagaio (1).wav")


func Vaca_Sound():
	$SonsAnimais.stream = vacaSound
	$SonsAnimais.play()

func Cobra_Sound():
	$SonsAnimais.stream = cobraSound
	$SonsAnimais.play()

func leao_Sound():
	$SonsAnimais.stream = leaoSound
	$SonsAnimais.play()
	
func bode_Sound():
	$SonsAnimais.stream = bodeSound
	$SonsAnimais.play()

func golf_Sound():
	$SonsAnimais.stream = golfSound
	$SonsAnimais.play()

func bird_Sound():
	$SonsAnimais.stream = birdSound
	$SonsAnimais.play()
