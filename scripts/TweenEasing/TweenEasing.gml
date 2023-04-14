/// !!!若初次使用此类型功能，请翻至本脚本154行以下查看说明。
enum easing_type { // 定义各种easing类型 // 通过 https://easings.net 来查看具体缓动
    linear,
    easeInQuad,
    easeOutQuad,
    easeInOutQuad,
    easeInCubic,
    easeOutCubic,
    easeInOutCubic,
    easeInQuart,
    easeOutQuart,
    easeInOutQuart,
    easeInQuint,
    easeOutQuint,
    easeInOutQuint,
    easeInSine,
    easeOutSine,
    easeInOutSine,
    easeInExpo,
    easeOutExpo,
    easeInOutExpo,
    easeInCirc,
    easeOutCirc,
    easeInOutCirc,
    easeInBack,
    easeOutBack,
    easeInOutBack,
    easeInElastic,
    easeOutElastic,
    easeInOutElastic,
    easeInBounce,
    easeOutBounce,
    easeInOutBounce,
	easeOutInBounce // !OutInBounce为非常规Easing
}
globalvar easing; // 存储各种easing函数的数组
easing = [
    function(t) { return t; }, // linear
    function(t) { return t*t; }, // easeInQuad
    function(t) { return t*(2-t); }, // easeOutQuad
    function(t) { return t<0.5 ? 2*t*t : -1+(4-2*t)*t; }, // easeInOutQuad
    function(t) { return t*t*t; }, // easeInCubic
    function(t) { return (--t)*t*t+1; }, // easeOutCubic
    function(t) { return t<0.5 ? 4*t*t*t : (t-1)*(2*t-2)*(2*t-2)+1; }, // easeInOutCubic
    function(t) { return t*t*t*t; }, // easeInQuart
    function(t) { return 1-(--t)*t*t*t; }, // easeOutQuart
    function(t) { return t<0.5 ? 8*t*t*t*t : 1-8*(--t)*t*t*t; }, // easeInOutQuart
    function(t) { return t*t*t*t*t; }, // easeInQuint
    function(t) { return 1+(--t)*t*t*t*t; }, // easeOutQuint
    function(t) { return (t<0.5 ? 16*t*t*t*t*t : 1+16*(--t)*t*t*t*t); }, // easeInOutQuint
    function(t) { return 1-cos(t*(pi/2)); }, // easeInSine
    function(t) { return sin(t*(pi/2)); }, // easeOutSine
    function(t) { return 0.5*(1-cos(pi*t)); }, // easeInOutSine
    function(t) { return (t==0) ? 0 : power(2, 10*(t-1)); }, // easeInExpo
    function(t) { return (t==1) ? 1 : (-power(2, -10*t)+1); }, // easeOutExpo
    function(t) { return (t==0 || t==1) ? t : (t<0.5 ? 0.5*power(2, (20*t)-10) : -0.5*power(2, (-20*t)+10)+1); }, // easeInOutExpo
    function(t) { return (t==0) ? 0 : power(1024, t-1); }, // easeInCirc
    function(t) { return sqrt(1-(--t)*t); }, // easeOutCirc
    function(t) { return t<0.5 ? (1-sqrt(1-4*t*t))/2 : (sqrt(-(2*t-3)*(2*t-1))+1)/2; }, // easeInOutCirc
	function(t) { return (t * t * ((2.70158 * t) - 1.70158)); }, // easeInBack
	function(t) { return 1 - easing[easing_type.easeInBack](1 - t); }, // easeOutBack
	function(t) { return (t<0.5 ? easing[easing_type.easeInBack](t * 2) * 0.5 : easing[easing_type.easeOutBack](t * 2 - 1) * 0.5 + 0.5); }, // easeInOutBack
	function(t) { return -(power(2, 10 * (t - 1)) * sin(((t - 1) - 0.075) * (2 * pi) / 0.3)); }, // easeInElastic
	function(t) { return (1 - easing[easing_type.easeInElastic](1 - t)); }, // easeOutElastic
	function(t) { return (t<0.5 ? easing[easing_type.easeInElastic](t * 2) * 0.5 : easing(easing_type.easeOutElastic)(t * 2 - 1) * 0.5 + 0.5); }, // easeInOutElastic
	function(t) { return (1 - easing[easing_type.easeOutInBounce](1 - t)); }, // easeInBounce
	function(t) { if(t<1/2.75) then return (7.5625 * t * t); else if(t<2/2.75) then return (7.5625 * (t - 1.5 / 2.75) * (t-1.5) + 0.75 ); else if(t<2.5/2.75) then return (7.5625 * ((t-2.25) / 2.75) * (t-2.25) + 0.9375); else return (7.5625 * ((t-2.625) / 2.75) * (t-2.625) + 0.984375); }, // easeOutBounce ///// !杂事 // 不知道easeOutBounce用以下写法为什么报错（恼），于是只能写作if-else了 //function(t) { return (t < 1/2.75 ? 7.5625 * t * t : (t < 2/2.75 ? 7.5625 * (t - 1.5/2.75) * (t - 1.5) + 0.75 : (t < 2.5/2.75 ? 7.5625 * (t - 2.25/2.75) * (t - 2.25) + 0.9375 : 7.5625 * (t - 2.625/2.75) * (t - 2.625) + 0.984375))); }
	function(t) { return (t<0.5 ? easing[easing_type.easeInBounce](t * 2) * 0.5 : easing[easing_type.easeOutBounce](t * 2 - 1) * 0.5 + 0.5 ); }, // easeInOutBounce
	function(t) { return (t<0.5 ? easing[easing_type.easeOutBounce](t * 2) * 0.5 : easing[easing_type.easeInBounce](t * 2 - 1) * 0.5 + 0.5); } // easeOutInBounce (!Special)
];
function easing_lerp(start, change, duration, current_frame, type=easing_type.linear, delay = 0 /* 此处delay无用.*/) {
    if (duration <= 0) {
        return start;
    };
    var easing_func = easing[type];
    var t = clamp((current_frame - start - delay) / duration, 0.0, 1.0);
    var value;
    if (current_frame < start + delay) {
        value = start;
    }; else {
        value = easing_func((t - delay / duration) * (duration / (duration - delay))) * change + start;
    };
    return value;
};
function easing_execute(target, val, start, change, duration, easing_class = easing_type.linear, delay = 0) {
	var class = instance_create_depth(0, 0, 0, easing_object);
		class.start = start;
		class.change = change;
		class.duration = duration;
		class.easing_class = easing_class;
		class.target = target;
		class.val = val;
		class.delay = delay;
	return true;
};
function easing_exists(target, target_var) {
    var obj_list = ds_list_create(); // 获取所有的easing对象
    with (easing_object) {
        ds_list_add(obj_list, id);
    };
    for (var i = 0; i < ds_list_size(obj_list); i++) { // 遍历所有的easing对象
        var obj = ds_list_find_value(obj_list, i);
		if (target == global && obj.val == target_var) {
			if (obj.delay > 0 || obj.duration > obj.nowTime) {
				ds_list_destroy(obj_list); // clear.
				return true;
			};
		};
        if (obj.target == target && obj.val == target_var) { // 如果该对象正在操作目标物体的目标变量
            if (obj.delay > 0 || obj.duration > obj.nowTime) { // 检查该对象是否还在执行动画
                ds_list_destroy(obj_list); // clear.
                return true;
            };
        };
    };
    ds_list_destroy(obj_list); // clear.
    return false;
};
function easing_destroy(target, target_var, skip) {
	if (!instance_exists(target)) {
		return false;
	};
    var obj_list = ds_list_create(); // 获取所有的easing对象
    with (easing_object) {
        ds_list_add(obj_list, id);
    };
    for (var i = 0; i < ds_list_size(obj_list); i++) { // 遍历所有的easing对象
        var obj = ds_list_find_value(obj_list, i);
		if (target == global && obj.val == target_var) { // 如果该对象正在操作目标全局变量
			if (skip) { // 如果需要跳过该对象
				variable_global_set(target_var, obj.start + obj.change); // 直接赋值最终变量
				instance_destroy(obj); // clear.
			}; else {
				instance_destroy(obj); // clear.
			};
			ds_list_delete(obj_list, i); // clear.
			break; // exit loop;
		};
        if (obj.target == target && obj.val == target_var) { // 如果该对象正在操作目标物体的目标变量
            if (skip) { // 如果需要跳过该对象
				variable_instance_set(target, target_var, obj.start + obj.change); // 直接赋值最终变量
				instance_destroy(obj); // clear.
            }; else {
                instance_destroy(obj); // clear.
            };
            ds_list_delete(obj_list, i); // clear.
            break; // exit loop;
        };
    };
    ds_list_destroy(obj_list); // clear.
	return true;
};
/*
================================================
easing.
全部方法说明+使用方法
*内容极其繁琐,选择性阅读*
		--- by cxx.
================================================
包括以下全部内容,本Easing为作者初尝试+新手,欢迎锐评;
带有_example的为实例物体,不影响Easing运行;
若进行工程转移,则仅需转移TweenEasing和easing_object;
script: easing {
	内有完整的easing(含枚举,使用数组保存),
	easing_lerp函数,
	easing_execute函数,
	easing_exists函数,
	easing_destroy函数;
}
object: easing_object {
	管理object
}
method: easing_execute方法使用如下:
	1.参数介绍:
		target         : 施加easing的物体(如果是全局变量则为global),
		val            : 变量名,需用string_type传递,
		start          : 变量开始更改的大小(⇔b),
		change         : 变量改变的大小(+-)(⇔c),
		duration       : 执行完成所用的时间(⇔d),
		[easing_class] : 使用枚举easing_type来访问,默认线性
		[delay]        : 延迟,在easing_object管理,默认0;
	2.示例:
		(1).
			easing_execute(id, "x", x, +90, 120, easing_type.easeInBack, 25);
			上面的代码,将会把运行此代码的物体(id)的x从x的值开始增加90(+90),一共120帧处理完,缓动为easeInBack(你可以通过声明枚举旁注释的网站来查阅缓动),延迟25帧执行;
		(2).
			easing_execute(global, "offset", global.offset, -300, 60,,5);
			上面的代码,将会把global.offset的值从global.offset开始减300,一共60帧处理完成,缓动未填写,即默认缓动(linear),延迟5帧执行;
		end;
	end;
end;
easing_exists {
	1.参数介绍:
		target          : 目标物体(全局变量为global),
		target_var      : 目标变量;
	2.实例:
		(1).
			easing_execute(enemy, "y", enemy.y, +30, 60, easing_type.easeOutSine);
			show_debug_message(easing_exists(enemy, "y"));
			上面的代码,先使easing_execute令enemy的y值从enemy.y开始增加30,一共60帧处理完成,缓动为easeOutSine.
			随后,输出了easing_exists,检测enemy的y值是否处于easing.
			此处返回值为true:因为enemy物体的y值处于easing. 相对的,会返回false;
		(2).
			show_debug_message(easing_exists(global, "board_width"));
			上面的代码,输出了easing_exists,检测global.board_width是否处于easing.
			一般的,此处的返回值为false,因为在上面没有easing(先前也没有,即不处于easing). 相对的,会返回true;
		end;
	end;
end;
}
easing_destroy {
	1.参数介绍:
		target         : 目标物体(全局变量为global),
		target_var     : 目标变量,
		skip           : 是否直接赋值最终值;
	2.实例:
		(1).
			Create event:
				easing_execute(id, "image_xscale", 10, -5, 300);
			Step Event:
				if (image_xsclae == 6){
					if (easing_exists(id, "image_xscale")) {
						easing_destroy(id, "image_xscale", true);
					}
				}
			上面的代码,先在创建事件给此物体一个easing(根据上文,读者可自行理解),
			随后在步事件,先检测image_xscale是否等于6,再检测是否处于easing,若真,则销毁此物体的easing,
			并且跳过过程[(6→5)⇒ image_xscale = 5],即最后的结果为image_xscale = 5;
		end;
	end;
end;
}
以上,便是一般用到的全部内容,
同时,本工程保留了_example开头的实例资源(不影响easing系统),可以作参考;(希望没BUG.(有误差))
========================================================================
========================================================================
后记:又删掉了一坨无意义的注释.
Thanks; --- by cxx.
*/