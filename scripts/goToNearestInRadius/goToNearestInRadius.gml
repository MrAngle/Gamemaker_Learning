// // W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// // https://help.yoyogames.com/hc/en-us/articles/360005277377


function MOVE_STRATEGY_SELF_goToNearestInRadius_PER_FRAME(_self) {
	MOVE_STRATEGY_goToNearestInRadius_PER_FRAME(
	_self,
	_self.targetingObj.priv_targetType,
	_self.targetingObj.priv_targetDistanceRadius,
	_self.stopDistance);
}


function MOVE_STRATEGY_goToNearestInRadius_PER_FRAME(_obj, _target_obj, _radius_real, _stopDistance_real) 
{
	with(_obj) {
		// Określ promień wykrywania wrogów
		var detection_radius = _radius_real;
		

		//_obj.speed = my_get_speed(_obj);


		// Znajdź najbliższego wroga
		var nearest_enemy = instance_nearest(x, y, _target_obj);
		setCurrentTarget(_obj, nearest_enemy);
		
		
		if(_obj.pathFinder.foundPath) {
			return;
		}
		
		
		//_obj.targetEnemyRef = nearest_enemy;

		// Sprawdź, czy jakiś wróg jest w zasięgu
		if (isNull(_obj.targetingObj.priv_currentTargetRef))
		{
			_obj.pathFinder.reachedTarget = false;
			speed = 0;
			return;
		}
		
		var distance_to_enemy = point_distance(
			x, y, 
			_obj.targetingObj.priv_currentTargetRef.x, 
			_obj.targetingObj.priv_currentTargetRef.y);

		if (distance_to_enemy <= detection_radius)
		{
		    if (distance_to_enemy > _stopDistance_real)
		    {
				
				var foundPath = MY_find_path_returnTrueIfFound(_obj);
				
				if(foundPath) {
					show_debug_message("znalazlem");
				} else {
					
				}
				_obj.pathFinder.reachedTarget = false;
				
				
		         //Oblicz kierunek do najbliższego wroga
		        //var dir = point_direction(x, y, _obj.targetEnemyRef.x, _obj.targetEnemyRef.y);

		        //// Ustaw prędkość i kierunek ruchu postaci
		        //speed = my_get_speed(_obj); // Możesz dostosować tę wartość
		        //direction = dir;
				//_obj.reachedTarget = false;
		    }
		    else
		    {
		        // Zatrzymaj postać, jeśli jest wystarczająco blisko wroga
		        speed = 0;
				_obj.pathFinder.reachedTarget = true;
		    }
		}
		else
		{
		    // Zatrzymaj postać, jeśli nie ma wrogów w pobliżu
		    speed = 0;
			_obj.pathFinder.reachedTarget = false;
		}

	}

}


//function is_path_clear(obj, target) {
//    var start_x = obj.x;
//    var start_y = obj.y;
//    var end_x = target.x;
//    var end_y = target.y;

//    // Sprawdź kolizje na linii między obiektem a celem
//    var collision = collision_line(start_x, start_y, end_x, end_y, abst_collision_super_parent.mask_index, true, false);

//    // Jeśli nie ma kolizji, ścieżka jest wolna
//    return (collision == noone);
//}

function ATTACK_STRATEGY_SELF_attackTargetWithSkill_PER_FRAME(_self, _skill_obj) {
			ATTACK_STRATEGY_attackTargetWithSkill_PER_FRAME(
			_self, 
			_self.targetingObj.priv_currentTargetRef, 
			_self.pathFinder.reachedTarget, 
			_skill_obj);
}


function ATTACK_STRATEGY_attackTargetWithSkill_PER_FRAME(_self, _target, _isTargetReached, _skill_obj) {
	if (_isTargetReached) {
		
		var _aim_angle = getAngleTowardsTarget(self.x, self.y, _target.x, _target.y);
		
		my_skill_invoke_3(self, self.x, self.y, global.LAYERS_INSTANCES, _skill_obj, 
			my_calculate_direction_enum(_aim_angle), _aim_angle, undefined)
		
		
		//my_skill_invoke(_self, _self.x, _self.y, global.LAYERS_INSTANCES, _skill_obj, _self.my_current_direction)
	}
}

function getAngleTowardsTarget(_obj_x, _obj_y, _target_x, _target_y) {
    // Oblicz kąt z pozycji obiektu do celu
    var angle = point_direction(_obj_x, _obj_y, _target_x, _target_y);

    // Zwróć obliczony kąt
    return angle;
}


//function getDirectionTowardsTarget(_obj_x, _obj_y, _target_x, _target_y) {
//    // Oblicz różnicę w pozycji między obiektem a celem
//    var dx = _target_x - _obj_x;
//    var dy = _target_y - _obj_y;

//    // Normalizuj różnice do wartości -1, 0, 1
//    var norm_dx = sign(dx);
//    var norm_dy = sign(dy);

//    // Określ kierunek na podstawie normalizowanych wartości
//    if (norm_dy == -1) {
//        if (norm_dx == -1) {
//            return MY_Direction.UP_LEFT;
//        } else if (norm_dx == 1) {
//            return MY_Direction.UP_RIGHT;
//        } else {
//            return MY_Direction.UP;
//        }
//    } else if (norm_dy == 1) {
//        if (norm_dx == -1) {
//            return MY_Direction.DOWN_LEFT;
//        } else if (norm_dx == 1) {
//            return MY_Direction.DOWN_RIGHT;
//        } else {
//            return MY_Direction.DOWN;
//        }
//    } else {
//        if (norm_dx == -1) {
//            return MY_Direction.LEFT;
//        } else if (norm_dx == 1) {
//            return MY_Direction.RIGHT;
//        }
//    }

//    // W przypadku gdy obiekt i cel są w tej samej pozycji
//    return -1; // Możesz zwrócić dowolną wartość domyślną lub -1 jako oznaczenie braku ruchu
//}
