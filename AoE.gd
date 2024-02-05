extends Area2D

func _ready() -> void:
	# ビューポートのサイズを取得
	var viewport_size: Vector2 = get_viewport_rect().size
	# オブジェクトをビューポートの中央に配置
	position = viewport_size / 2
	
	var aoe_radius:float = $HitArea.shape.radius
	#$HitArea.shape.set_radius(0.0)
	$HitArea.shape.radius = 0.0
	print($HitArea.shape.radius)
	#print(aoe_radius)

func _init() -> void:
	#aoe_radius: float = $HitArea.shape.radius
	pass

func _on_timer_timeout() -> void:
	print("time out emit")
	$HitArea.shape.radius = 100.0
	queue_free()
	# set_visible(false)
	#self.hide()
	

func _on_body_entered(body: Node2D) -> void:
	print("on_body_entered!",body)
	if body.name == "Me":
		print("Me Entered")
		pass
