//if (keyboard_check(vk_shift)) {
    //my_set_speed(self, my_get_base_speed());
//}

var modifier_id = "freeze_shift";
if (ds_map_exists(self.my_priv_speed_modifiers, modifier_id)) {
    ds_map_delete(self.my_priv_speed_modifiers, modifier_id);
}