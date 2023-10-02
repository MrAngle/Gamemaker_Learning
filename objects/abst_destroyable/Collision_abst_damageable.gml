self.my_current_health = my_apply_damage(self.id, self.my_current_health, other.my_damage);
my_check_if_dead(self.my_current_health)

my_hit_animation_duration_counter = self.my_hit_animation_duration;