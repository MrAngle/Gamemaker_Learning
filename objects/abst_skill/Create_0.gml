my_INHERITENCE_movable(self);
my_INHERITENCE_skill(self);
my_INHERITENCE_skill_sequencer(self);
my_INHERITENCE_skill_hit_timer(self);

self.inCollistionTarget = undefined;

if(self.my_priv_create_in_description_mode) {
	//show_debug_message("[ABST_SKIll] Utworzono w trybie description_mode");
	instance_deactivate_object(self);
	my_priv_base_speed = 0;
	speed = 0;
}

on_destroy_sprite = sprite_default_on_destroy;

on_collision_function = function(_self) {
}

on_destroy_function = function(_self) {
	
}

invokerHittableChecker_returnTrueIfShouldProcess = function(_self, _target) {
	with(_self) {
		if(_self.my_invoker == undefined) {
			return true;
		}
		if(_self.my_invoker == _target && _self.my_invoker_not_hittable_counter > 0) {
			return false;
		}
		return true;
	}
}

countInvokerHittableStartProtection = function(_self) {
	with(_self) {
		 _self.my_invoker_not_hittable_counter -= 1;
	}
}