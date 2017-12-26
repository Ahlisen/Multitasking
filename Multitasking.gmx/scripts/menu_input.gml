if(room == rm_menu) {
    teams += keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
    teams = clamp(teams, 2, 6);
    
    controllers = 0;
    var gp_num = gamepad_get_device_count();
    for (var i = 0; i < gp_num; i++;){
        if gamepad_is_connected(i) controllers++;
    }
    
    if(keyboard_check_pressed(vk_anykey)) {
        audio_play_sound(snd_thump,2,false);
    }
    
    if(keyboard_check_pressed(vk_add)) {
        secondary_keyboard = !secondary_keyboard;
    }
}

if(keyboard_check_released(vk_space)) {
    if(room != room_last) {
        room_goto_next();
    } else {
        if(o_level.game_over) {
            room_restart();
        }
    }
}

if(keyboard_check_released(vk_escape)) {
    if(room == rm_main) {
        game_restart();
    } else {
        game_end();
    }
}