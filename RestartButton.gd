extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# TextureButtonの現在の座標を取得
	var position = global_position
	# 座標をコンソールに表示
	print("TextureButtonの座標: ", position)
	 # 親ノードのグローバル座標を取得して、TextureButtonの相対座標を加算する
	var g_position = get_parent().get_global_transform().origin
	# 座標をコンソールに表示
	print("TextureButtonのグローバル座標: ", g_position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
