//if (keyboard_check(vk_shift)) {
    //my_set_speed(self, my_get_base_speed());
//}
my_STATE_aiming = false;

remove_ModifierBySkillListEnum(self, MY_SKILL_LIST.AIMING);


my_TRIGGER_direction_change(self);