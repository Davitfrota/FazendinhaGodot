extends Node2D

var Game1 = load("res://relaxing_country_music_farm_game_music_by_w_o_w_sound_1215722938723866648.ogg")
var Game2 = load("res://Videos & Audio/Audio/dwarf_mining_music_dwarf_mining_town_126765102039907433.ogg")
var Game3= load("res://Videos & Audio/Audio/medieval_music_cobblestone_village_Wqn3_nIByoK-gucZ5bdc.ogg")
var Menu = load("res://relaxing_country_music_farm_game_music_by_w_o_w_sound_1215722938723866648.ogg")
var Tela = load("res://Videos & Audio/Audio/isabella_s_lullaby_the_promised_neverland_lofi_-7433177121852572551.ogg")
var YEAA = load("res://Crianças-Felizes-Gritando-Efeito-Sonoro_160k.wav")
var OWWWWN = load("res://kid_sound_effect_child_sound_effect_-6735966493874171424-_mp3cut-_mp3cut.net_.wav")


func Game1_music():
	$Music.stream = Game1
	$Music.play()

func Yea_music():
	$Music.stream = YEAA
	$Music.play()

func Own_music():
	$Music.stream = OWWWWN
	$Music.play()

func Menu_music():
	$Music.stream = Menu
	$Music.play()

func Tela_music():
	$Music.stream = Tela
	$Music.play()
	
func Mute():
	$Music.volume_db = -100
func desMute():
	$Music.volume_db = 0

func Baixar():
	$Music.volume_db = -10
