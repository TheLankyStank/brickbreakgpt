/// @description Insert description here
// You can write your code in this editor

// Track previous position
prev_x = x;

// Define a constant speed for the paddle
var move_speed = 5;

// Paddle movement
if (keyboard_check(vk_left)) {
    x -= move_speed;
}
if (keyboard_check(vk_right)) {
    x += move_speed;
}

// Keep the paddle within the room boundaries
if (x < 0) {
    x = 0;
}
if (x > room_width - sprite_width) {
    x = room_width - sprite_width;
}

// Calculate paddle speed
paddle_speed = x - prev_x;
