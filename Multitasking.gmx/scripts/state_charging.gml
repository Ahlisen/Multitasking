///state_charging()
if(animation < 1) {
    x = lerp(current_x, target_x, animation);
    y = lerp(current_y, target_y, animation);
    animation += animation_increment;
} else {
    animation = 0;
    
    //Restore
    x = target_x;
    y = target_y;
    xx = (target_x-CELL_WIDTH div 2) div CELL_WIDTH;
    yy = (target_y-CELL_HEIGHT div 2) div CELL_HEIGHT;
    
    var left = grid_place_free(xx+lengthdir_x(1,dir-90),yy+lengthdir_y(1,dir-90));
    var right = grid_place_free(xx+lengthdir_x(1,dir+90),yy+lengthdir_y(1,dir+90));
    
    if(left ^^ right) {
        if(left) {
            dir = dir-90;
        } else {
            dir = dir+90;
        }
        if animation_multiplier < 4 {
            animation_multiplier++;
        }
        image_angle = dir;
        audio_play_sound(snd_rubber, 5, false);
        prepare_to_move(dir, 50, state_charging);
    } else {
        //Bounce
        animation_multiplier = 1;
        bounce_x = 2*lengthdir_x(animation_multiplier, dir);
        bounce_y = 2*lengthdir_y(animation_multiplier, dir);
        bounce_size_x = power(0.9, animation_multiplier);
        bounce_size_y = power(1.05, animation_multiplier);
        state = state_collision;
        audio_play_sound(collision_sound,0,false);
        image_blend = color;
    }
}





/*
dir = image_angle;
var lenx = lengthdir_x(1, dir);
var leny = lengthdir_y(1, dir);
check_x = xx + lenx;
check_y = yy + leny;
if(grid_place_free(check_x,check_y)) {
    current_x = x;
    current_y = y;
    target_x = check_x*CELL_WIDTH+CELL_WIDTH/2;
    target_y = check_y*CELL_HEIGHT+CELL_HEIGHT/2;
    xx = check_x;
    yy = check_y;
    state = state_move;
} else {
    bounce_x = 2*lenx;
    bounce_y = 2*leny;
    bounce_size_x = 0.9;
    bounce_size_y = 1.05;
    state = state_collision;
    audio_play_sound(snd_bounce,0,false);
    image_blend = color;
}
image_angle = dir;
animation = 0;
