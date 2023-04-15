// 本物体仅作为实例工程的实例物体，不影响easing系统
window_set_caption("easing - by cxx for Gamemaker.");
for (var p = 0,i = 0; i <= room_height; i += sprite_get_width(_example_sprite)){
	var inst = instance_create_depth(1200, i, 0, _example_object);
	easing_execute(inst, "image_xscale", inst.image_xscale, +20, 200, easing_type.easeOutElastic, p);
	p += 15;
};
x = 0;
global.temp = 0;
easing_execute(id, "x", 0, +1200, 120,,60);
easing_execute(global, "temp", 0, +120, 200);
