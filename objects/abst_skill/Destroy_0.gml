my_DESTRUCTOR_skill_sequencer(self);
my_DESTRUCTOR_skill_hit_timer(self);

sprite_index = on_destroy_sprite;

var explosion = instance_create_layer(x, y, global.LAYERS_INSTANCES, abst_emmiter);

on_destroy_function(self);