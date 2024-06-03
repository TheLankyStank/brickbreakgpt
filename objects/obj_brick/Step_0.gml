// Move the brick
x += lengthdir_x(brick_speed, brick_direction);
y += lengthdir_y(brick_speed, brick_direction);

// Check for collisions with the room boundaries and reflect direction
if (x < 0 || x > room_width - sprite_width || y < 0 || y > room_height - sprite_height) {
    if (brick_size > 4) { // Minimum size condition
        // Create two smaller bricks
        var new_size = brick_size / 2;
        var new_speed = brick_speed;
        
        var brick1 = instance_create_layer(x, y, layer, obj_brick);
        brick1.image_xscale = new_size / sprite_width;
        brick1.image_yscale = new_size / sprite_height;
        brick1.brick_size = new_size;
        brick1.brick_speed = new_speed;
        brick1.brick_direction = irandom_range(0, 359);
        
        var brick2 = instance_create_layer(x, y, layer, obj_brick);
        brick2.image_xscale = new_size / sprite_width;
        brick2.image_yscale = new_size / sprite_height;
        brick2.brick_size = new_size;
        brick2.brick_speed = new_speed;
        brick2.brick_direction = irandom_range(0, 359);
    }
    instance_destroy();
}
