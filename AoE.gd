extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var draw_node = draw_circle_node.new()
	draw_node.radius = 100
	add_child(draw_node)
	
	# ビューポートのサイズを取得
	var viewport_size = get_viewport_rect().size
	# オブジェクトをビューポートの中央に配置
	position = viewport_size / 2

class  draw_circle_node extends Node2D:
	var radius = 100
	var color = Color(1, 0, 0, 0.5)
	
	func _draw():
		draw_circle(Vector2.ZERO, radius, color)
	
	func _ready():
		#update()
		pass
