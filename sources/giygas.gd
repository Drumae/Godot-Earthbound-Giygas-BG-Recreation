extends TextureRect
var f = 0.016 # Duration of one frame (seconds)
var m = 1.25
var m2 = 1.0
	
func inc():
	for i in range(251):
		material.set_shader_parameter("a", i)
		await get_tree().create_timer(f * m * m2).timeout
		
func dec():
	for i in range(250, -1, -1):
		material.set_shader_parameter("a", i)
		await get_tree().create_timer(f * m * m2).timeout
		
func _ready():
	await inc()
	await dec()
	await get_tree().create_timer(f * 5).timeout
	material.set_shader_parameter("v_osc", true)
	m2 = 0.8
	await inc()
	await dec()
	await get_tree().create_timer(f * 5).timeout
	material.set_shader_parameter("v_osc", false)
	m2 = 1.00
	_ready()
