my_priv_spawn_counter--;

if (my_priv_spawn_counter <= 0) {
    // Spawnuj potwora
    instance_create_layer(x, y, my_layer, my_enemy_instance);  // Zakładając, że potwór nazywa się "obj_monster"
    
    // Resetuj licznik
   my_priv_spawn_counter = my_priv_spawn_time_by_fps;
}
