var invokerHasStartProtection = !invokerHittableChecker_returnTrueIfShouldProcess(self, other);
if(invokerHasStartProtection) {
	return;
}


var shouldProcess = my_SHOULD_PROCESS_ActionBasedOn_HIT_TIMER(self, other);

if(!shouldProcess) {
	return;
}

self.inCollistionTarget = other;
//self.targetHit = true;

my_DEFAULT_TARGET_REACT_ANIMATION(self);

my_ExecuteAllSkillActions(self, other);

on_collision_function(self);