// // W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// // https://help.yoyogames.com/hc/en-us/articles/360005277377


function create_targetingObject_returnObject(_finalDestinationTarget, _targetFamilyType, _targetDistanceRadius) {
	var targetingObj = {
		// should be set by setter
		priv_currentTargetRef: _finalDestinationTarget,
		priv_finalTargetRef: _finalDestinationTarget,
		priv_targetType: _targetFamilyType,
		priv_targetDistanceRadius: _targetDistanceRadius
	}
	
	return targetingObj
}


function setCurrentTarget(_obj_self, _currentTarget) {
	if(_currentTarget != _obj_self.targetingObj.priv_currentTargetRef) {
		_obj_self.targetingObj.priv_currentTargetRef = _currentTarget;
		_obj_self.pathFinder.foundPath = false;
	}
}