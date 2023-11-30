global.KEY_SELECTOR = undefined;
function getKeySelector() {
	if(global.KEY_SELECTOR == undefined) {
		global.KEY_SELECTOR = instance_create_layer(0, 0, global.LAYERS_INVISIBLE, obj_key_selector);
	}
	return global.KEY_SELECTOR;
}

enum KEYS_INDEX {
    Q,
    W,
}