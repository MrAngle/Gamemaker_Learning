//function custom_moveable_init(_instance) {
//    _instance.MY_IS_TYPE_MOVEABLE = true;
//    _instance.my_is_moveable = true;
//    _instance.my_current_direction = MY_Direction.LEFT;
//    _instance.my_priv_speed = 0;
//}

//// Create Event w obiekcie-dziecku (przed wywołaniem event_inherited()):

//my_object_moveable_init_function = custom_moveable_init;

//my_INHERITENCE_movable(object_index)
my_INHERITENCE_attachment(object_index);
my_current_direction = MY_Direction.RIGHT;
//my_assign_movable_global_param(self, self.my_attach_to_obj)
//my_start_move_moveable_obj(self);