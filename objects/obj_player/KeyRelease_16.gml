//if (keyboard_check(vk_shift)) {
    //my_set_speed(self, my_get_base_speed());
//}
my_STATE_aiming = false;

var _modifier_id = MY_MOVE_MODIFICATOR_TYPE.AIMING;
if (ds_map_exists(self.my_priv_speed_modifiers, _modifier_id)) {
    ds_map_delete(self.my_priv_speed_modifiers, _modifier_id);
	
}

my_TRIGGER_direction_change(self);