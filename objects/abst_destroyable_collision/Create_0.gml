my_initialize_destroyable_object()
my_INHERITENCE_movable(self);

my_priv_dot_modifiers = ds_map_create();

function get_dot_modifier(_target) {
    return _target.my_priv_dot_modifiers;
}

function set_dot_modifier(_target, _modificator) {
    _target.my_priv_dot_modifiers
		[? _modificator[global.MODIFICATOR_SKILL_NAME_ID_KEY]] = _modificator
}
	