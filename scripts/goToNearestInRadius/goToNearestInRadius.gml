// // W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// // https://help.yoyogames.com/hc/en-us/articles/360005277377
function MOVE_STRATEGY_goToNearestInRadius_PER_FRAME(_obj, _target_obj, _radius_real, _stopDistance_real) 
{
	with(_obj) {
		// Określ promień wykrywania wrogów
		var detection_radius = _radius_real;
		


		// Znajdź najbliższego wroga
		var nearest_enemy = instance_nearest(x, y, _target_obj);
		_obj.targetEnemyRef = nearest_enemy;

		// Sprawdź, czy jakiś wróg jest w zasięgu
		if (_obj.targetEnemyRef == noone || _obj.targetEnemyRef == undefined)
		{
			_obj.reachedTarget = false;
			speed = 0;
			return;
		}
		
				
		var _collision_width = sprite_get_width(_obj.targetEnemyRef.sprite_index);
		var _collision_height = sprite_get_height(_obj.targetEnemyRef.sprite_index);
		var _collision_offset = ( _collision_width + _collision_height ) / 4; // Średnia z połowy szerokości i wysokości

		var calculatedStopRadius = _stopDistance_real + _collision_offset;
		
		var distance_to_enemy = point_distance(x, y, _obj.targetEnemyRef.x, _obj.targetEnemyRef.y);

		if (distance_to_enemy <= detection_radius)
		{
		    if (distance_to_enemy > calculatedStopRadius)
		    {
		        // Oblicz kierunek do najbliższego wroga
		        var dir = point_direction(x, y, _obj.targetEnemyRef.x, _obj.targetEnemyRef.y);

		        // Ustaw prędkość i kierunek ruchu postaci
		        speed = my_get_speed(_obj); // Możesz dostosować tę wartość
		        direction = dir;
				_obj.reachedTarget = false;
		    }
		    else
		    {
		        // Zatrzymaj postać, jeśli jest wystarczająco blisko wroga
		        speed = 0;
				_obj.reachedTarget = true;
		    }
		}
		else
		{
		    // Zatrzymaj postać, jeśli nie ma wrogów w pobliżu
		    speed = 0;
			_obj.reachedTarget = false;
		}

	}

}


function ATTACK_STRATEGY_attackTargetWithSkill_PER_FRAME(_self, _isTargetReached, _skill_obj) {
	if (_isTargetReached) {
		my_skill_invoke(_self, _self.x, _self.y, global.LAYERS_INSTANCES, _skill_obj, _self.my_current_direction)
	}
}


function getDirectionTowardsTarget(_obj_x, _obj_y, _target_x, _target_y) {
    // Oblicz różnicę w pozycji między obiektem a celem
    var dx = _target_x - _obj_x;
    var dy = _target_y - _obj_y;

    // Normalizuj różnice do wartości -1, 0, 1
    var norm_dx = sign(dx);
    var norm_dy = sign(dy);

    // Określ kierunek na podstawie normalizowanych wartości
    if (norm_dy == -1) {
        if (norm_dx == -1) {
            return MY_Direction.UP_LEFT;
        } else if (norm_dx == 1) {
            return MY_Direction.UP_RIGHT;
        } else {
            return MY_Direction.UP;
        }
    } else if (norm_dy == 1) {
        if (norm_dx == -1) {
            return MY_Direction.DOWN_LEFT;
        } else if (norm_dx == 1) {
            return MY_Direction.DOWN_RIGHT;
        } else {
            return MY_Direction.DOWN;
        }
    } else {
        if (norm_dx == -1) {
            return MY_Direction.LEFT;
        } else if (norm_dx == 1) {
            return MY_Direction.RIGHT;
        }
    }

    // W przypadku gdy obiekt i cel są w tej samej pozycji
    return -1; // Możesz zwrócić dowolną wartość domyślną lub -1 jako oznaczenie braku ruchu
}
