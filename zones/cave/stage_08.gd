extends Level


func _ready():
	var t = Timer.new()
	t.wait_time = 0.5
	t.one_shot = true
	t.connect( "timeout", self, "_connect_areas" )
	add_child( t )
	t.start()

func _connect_areas() -> void:
	var _ret = $starting_position.connect( "body_entered", self, \
		"_on_entering_starting_area" )
	_ret = $finish_position.connect( "body_entered", self, \
		"_on_entering_finish_area" )


func _on_entering_starting_area( _body ) -> void:
	gamestate.state.current_lvl = "res://zones/forest/stage_13.tscn"
	gamestate.state.current_pos = "finish_position2"
	gamestate.state.current_dir = game.player.dir_cur
	game.main.load_gamestate()

func _on_entering_finish_area( _body ) -> void:
	gamestate.state.current_lvl = "res://zones/cave/stage_01.tscn"
	gamestate.state.current_pos = "starting_position"
	gamestate.state.current_dir = game.player.dir_cur
	game.main.load_gamestate()