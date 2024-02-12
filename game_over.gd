extends Control

# どちらのボタンをクリックしたかわかるようにボタンの種類を定義
enum{
	RESTART,
	QUIT,
}

# Line2Dの四角い枠が2つのボタンを囲う位置の配列
var square_pose = [
	# Restart
	Vector2(275, 350),
	#Quit
	Vector2(350, 350)
]

# enumで定義したパラメータを格納する
var selected_option = null
# Restartボタンを押したときにConfirmationDialogに格納するテキスト
var restart_text = "Do you really want to restart the game?"
# Quitボタン押したときにConfirmationDialogに格納するテキスト
var quit_text = "Do you really want to quit the game?"
# RestartButtonのノード参照
@onready var n_restart_btn = $VBoxContainer/ButtonsHBox/RestartVBox/RestartButton
# QuitButtonのノード参照
@onready var n_quit_btn = $VBoxContainer/ButtonsHBox/QuitVBox/QuitButton
# ColorRectのノード参照
@onready var n_color_rect = $ColorRect
# ConfirmationDialogのノード参照
@onready var n_confirmation_dialog = $ConfirmationDialog
# Line2Dのノード参照
@onready var n_line2D = $Line2D
# AnimationPlayerのノード参照
@onready var n_anim_player = $Line2D/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# ゲーム開始時はColorRectは非表示
	n_color_rect.visible = false
	# ゲーム開始時にAnimationPlayerのblink_squareアニメを再生
	n_anim_player.play("blink_square")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
