// // Script assets have changed for v2.3.0 see
// // https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function my_calculate_damage(_damageable_skill) {
	return floor(random_range(_damageable_skill.my_min_damage, _damageable_skill.my_max_damage + 1));
}