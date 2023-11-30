global.KEY_SELECTOR = undefined;
function getKeySelector() {
	if(global.KEY_SELECTOR == undefined) {
		global.KEY_SELECTOR = instance_create_layer(0, 0, global.LAYERS_INVISIBLE, obj_key_selector);
	}
	return global.KEY_SELECTOR;
}

function getSkill(keyIndexEnum) {
	return getKeySelector().keys[keyIndexEnum].skillRef
}



enum KEYS_INDEX {
    Q,
    W,
	E,
	R,
	SPACE
}