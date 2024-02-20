extends Control

# どちらのボタンをクリックしたかわかるようにボタンの種類を定義
enum{
	RESTART,
	QUIT,
}

# Line2Dの四角い枠が2つのボタンを囲う位置の配列
var square_pos = [
	# Restart
	Vector2(275, 350),
	#Quit
	Vector2(382.5, 350)
]

# enumで定義したパラメータを格納する
var selected_option:Variant
# Restartボタンを押したときにConfirmationDialogに格納するテキスト
var restart_text:String = "Do you really want to restart the game?"
# Quitボタン押したときにConfirmationDialogに格納するテキスト
var quit_text:String = "Do you really want to quit the game?"
# RestartButtonのノード参照
@onready var n_restart_btn:TextureButton = $VBoxContainer/ButtonsHBox/RestartVBox/RestartButton
# QuitButtonのノード参照
@onready var n_quit_btn:TextureButton = $VBoxContainer/ButtonsHBox/QuitVBox/QuitButton
# ColorRectのノード参照
@onready var n_color_rect:ColorRect = $ColorRect
# ConfirmationDialogのノード参照
@onready var n_confirmation_dialog:ConfirmationDialog = $ConfirmationDialog
# Line2Dのノード参照
@onready var n_line2D:Line2D = $Line2D
# AnimationPlayerのノード参照
@onready var n_anim_player:AnimationPlayer = $Line2D/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# ゲーム開始時はColorRectは非表示
	n_color_rect.visible = false
	# ゲーム開始時にAnimationPlayerのblink_squareアニメを再生
	n_anim_player.play("blink_square")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_restart_button_mouse_entered() -> void:
	n_line2D.position = square_pos[0]
	


func _on_quit_button_mouse_entered() -> void:
	n_line2D.position = square_pos[1]
	


func _on_restart_button_button_up() -> void:
	work_at_button_up(RESTART)


func _on_quit_button_button_up() -> void:
	work_at_button_up(QUIT)


# ボタンを押したときに呼ばれるメソッドを定義
func work_at_button_up(option) -> void :
	# 押したボタンに応じたenumパラメータを保持する引数optionを渡す
	selected_option = option
	# ColorRectノードを表示にして後ろを暗くする
	n_color_rect.visible = true
	# Restartボタンが押された場合
	if selected_option == RESTART:
		# ConfirmationDialogノードのTextプロパティにrestart_textの文字列を適用させる
		n_confirmation_dialog.dialog_text = restart_text
	# Quitボタンが押された場合
	elif selected_option == QUIT:
		# ConfirmationDialogノードのTextプロパティにquit_textの文字列を適用させる
		n_confirmation_dialog.dialog_text = quit_text
	# ConfirmationDialogを画面中央に表示
	n_confirmation_dialog.popup_centered()


func _on_confirmation_dialog_confirmed() -> void:
	# Restartボタンを押した場合
	if selected_option == RESTART:
		# シーンツリーの一時停止を再開する
		get_tree().paused = false
		# デバッグ用
		print("Scene tree paused: ", get_tree().paused)
		# 指定シーンを読み込み直し、ゲームを始めから再開する
		get_tree().change_scene_to_file("res://main.tscn")
		# デバッグ用
		print("The game is restarted.")
	# Quitボタンを押した場合
	elif selected_option == QUIT:
		# ゲームを完全終了
		get_tree().quit()
		# デバッグ用
		print("The game is quited.")


func _on_confirmation_dialog_canceled() -> void:
	# ボタン洗濯ステータスをリセット(値なし)
	selected_option = null
	# ConfirmationDialogノードのdealog_textプロパティのテキストを消す
	n_confirmation_dialog.dialog_text = ""
	# ColorRectノードを非表示に
	n_color_rect.visible = false


func _input(event: InputEvent) -> void:
	# もしGameOverノードが表示されていたら(ゲームオーバーになったら)
	if visible:
		# もし ←キー が押されてキーから指が離れたら
		if event.is_action_released("ui_left"):
			# Line2Dの枠をRestart側に配置する
			n_line2D.position = square_pos[0]
		# もし →キー が押されてキーから指が離れたら
		elif event.is_action_released("ui_right"):
			# Line2Dの枠をQuit側に配置する
			n_line2D.position = square_pos[1]
		# もし spaceかenterが押されて指が離れて、かつColorRectが非表示なら
		elif event.is_action_released("ui_accept") and not n_color_rect.visible:
			# もしLine2Dの枠がRestart側に配置されていたら
			if n_line2D.position == square_pos[0]:
				# Restartボタンをクリックした時のメソッドを実行
				_on_restart_button_button_up()
			# もしLine2Dの枠がQuit側に配置されていたら
			elif n_line2D.position == square_pos[1]:
				# Quitボタンをクリックした時のメソッドを実行
				_on_quit_button_button_up()
