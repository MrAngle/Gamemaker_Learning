function custom_moveable_init(_instance) {
    _instance.MY_IS_TYPE_MOVEABLE = true;
    _instance.my_is_moveable = false;
    _instance.my_current_direction = MY_Direction.RIGHT;
    _instance.my_priv_base_speed = 0;
}



// Create Event w obiekcie-dziecku (przed wywołaniem event_inherited()):

my_object_moveable_init_function = custom_moveable_init;

event_inherited();

self.my_skill_name = MY_SKILL_LIST.WIND_1;
self.hit_time_interval = 999;
self.my_damage = floor(random_range(self.my_min_damage, self.my_max_damage + 1));
my_DEFAULT_simple_push_action(self);

//alarm[0] = 1;  // Ustawienie alarmu na 1 klatkę