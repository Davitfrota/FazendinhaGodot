extends Node2D

func _ready():
	Global.get_buttons_from_scene(self)
	Controller.set_actual_button($Retangulo)

func _on_Triangulo_pressed():
	Error.Correct_music()
	$AnimationPlayer.play("Correct")
	yield($AnimationPlayer,"animation_finished")
	Global.add_points(1)
	Global.choose_level()

func _on_Retangulo_pressed():
	Error.Error_music()
	$AnimationPlayer.play("Erro")
func _on_Quadrado_pressed():
	Error.Error_music()
	$AnimationPlayer.play("Erro")
	Global.add_points(-1)

func _on_Circulo_pressed():
	Error.Error_music()
	$AnimationPlayer.play("Erro")
	Global.add_points(-1)
