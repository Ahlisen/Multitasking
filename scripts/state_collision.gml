///state_collision()
if(animation < 1) {
    offset_x = lerp(bounce_x, 0, smoothstep(animation));
    offset_y = lerp(bounce_y, 0, smoothstep(animation));
    image_xscale = lerp(bounce_size_x, 1, smoothstep(animation));
    image_yscale = lerp(bounce_size_y, 1, smoothstep(animation));
    animation += animation_speed;
} else {
    state = std_state;
    offset_x = 0;
    offset_y = 0;
    animation = 0;
}
