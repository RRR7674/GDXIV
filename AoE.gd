extends Area2D

func _ready() -> void:
	# ビューポートのサイズを取得
	var viewport_size: Vector2 = get_viewport_rect().size
	# オブジェクトをビューポートの中央に配置
	position = viewport_size / 2

func _on_timer_timeout() -> void:
	 
	queue_free()
	
func _on_body_entered(body: Node2D) -> void:
	print("on_body_entered!",body)
	if body.name == "Me" and body.INVINCIBLE == false and body.can_hit == true:
		print("Hit!")
		Audio.get_node("SeFail").play()
		
