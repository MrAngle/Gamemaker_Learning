enum SKILL_PHASE { // default order
	
    INITIATION,       // Etap inicjacji umiejętności (przygotowanie do użycia, np. rozpoczęcie animacji)
    BEFORE_EXECUTION,
    DAMAGE,			  // return damage dealt  function(skill, target)
    HEAL,			  // should always return heal value (int)
	OTHER_EFFECTS,
	BUFF,
	DEBUFF,
    AFTEREFFECT,      // Efekty uboczne po użyciu umiejętności (np. podpalenie)
    PUSH,      // Efekty uboczne po użyciu umiejętności (np. podpalenie)
    TARGET_REACT_ANIMATION, 
    SUM_UP_TARGET_STATE,
    COMPLETION        // Zakończenie działania umiejętności (czyszczenie wszystkich tymczasowych efektów, resetowanie zmiennych itp.)
}



function my_createSkillAction(_skill_phase_enum, _function_to_execute, _priority) {
	return {
        skill_phase_enum: _skill_phase_enum,
        function_to_execute: _function_to_execute,
        priority: _priority
    };
}

function my_addSkillAction(_skill_list, _skill) {
    ds_list_add(_skill_list, _skill);
}


//function my_SkillComparator(a, b) {
//    if (a.skill_phase_enum < b.skill_phase_enum) return -1;
//    if (a.skill_phase_enum > b.skill_phase_enum) return 1;

//    // Jeśli faza jest taka sama, porównaj priorytet
//    if (a.priority < b.priority) return -1;
//    if (a.priority > b.priority) return 1;

//    return 0; // jeśli obie umiejętności są takie same
//}


//function my_SortSkillList(skillList) {
//    var size = ds_list_size(skillList);
    
//    for (var i = 0; i < size - 1; i++) {
//        for (var j = i + 1; j < size; j++) {
//            var skillA = skillList[| i];
//            var skillB = skillList[| j];

//            if (my_SkillComparator(skillA, skillB) > 0) {
//                // Swap items manually
//                skillList[| i] = skillB;
//                skillList[| j] = skillA;
//            }
//        }
//    }
//}

function my_ManageSkillAction(_skill_obj, _target_obj, _skill_action_struct) {
	switch(_skill_action_struct.skill_phase_enum) {
	    case SKILL_PHASE.INITIATION:
	    case SKILL_PHASE.BEFORE_EXECUTION:
			_skill_action_struct.function_to_execute(_skill_obj, _target_obj);
			break;
	    case SKILL_PHASE.DAMAGE:
	        _skill_obj.damage_dealt_per_activation += _skill_action_struct.function_to_execute(_skill_obj, _target_obj);
			break;

	    case SKILL_PHASE.OTHER_EFFECTS:
	    case SKILL_PHASE.BUFF:
	    case SKILL_PHASE.DEBUFF:
	    case SKILL_PHASE.AFTEREFFECT:
	    case SKILL_PHASE.TARGET_REACT_ANIMATION:
		case SKILL_PHASE.PUSH: 
			_skill_action_struct.function_to_execute(_skill_obj, _target_obj);
			break;
			
	    case SKILL_PHASE.SUM_UP_TARGET_STATE:
	    case SKILL_PHASE.COMPLETION:
			_skill_action_struct.function_to_execute(_skill_obj, _target_obj);
	        break;
	}
}

