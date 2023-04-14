if (delay != 0) then delay--;

if (delay == 0) then if(nowTime != duration) then nowTime++; // nowTime<duration

if (delay == 0){
	if (target != global) {
		var value = easing_lerp(start, change, duration, nowTime, easing_class);
		variable_instance_set(target, val, value);
	}; else {
		var value = easing_lerp(start, change, duration, nowTime, easing_class);
		variable_global_set(val, value);
	};
};
if (nowTime+delay == duration) {
	instance_destroy();
};
