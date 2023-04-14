draw_text(20,20,"fps="+string(fps)+
chr(10)+"main.x="+string(x)+
chr(10)+"instance_count="+string(instance_count)+
chr(10)+"example.num="+string(instance_number(_example_object))+
chr(10)+"global.temp="+string(global.temp)+
chr(10)+"this.easingExists="+string(easing_exists(id, "x"))+
chr(10)+"is_easing(global.temp)="+string(easing_exists(global, "temp"))
);
if (x == 700) {
	if (easing_exists(id, "x")){
		easing_destroy(id, "x", true);
	};
};
if (x == 100) {
	if (easing_exists(global, "temp")) {
		easing_destroy(global, "temp", false);
	};
};
if (keyboard_check_pressed(vk_f2)) then game_restart();