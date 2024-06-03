/// @description Insert description here
// You can write your code in this editor

image_blend = make_colour_hsv(random(255), random(255), random(255));

// Set initial speed and direction for the bricks
brick_speed = 2;
brick_direction = irandom_range(0, 359); // Random direction in degrees

// Set initial size
brick_size = sprite_width;
