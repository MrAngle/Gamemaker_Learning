var shouldProcess = my_SHOULD_PROCESS_ActionBasedOn_HIT_TIMER(self, other);

if(!shouldProcess) {
	return;
}

my_DEFAULT_TARGET_REACT_ANIMATION(self);

my_ExecuteAllSkillActions(self, other);

on_collision_function(self);