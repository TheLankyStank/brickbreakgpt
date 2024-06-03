// Move the ball
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Check for collisions with the room boundaries
if (x < 0 || x > room_width - sprite_width) {
    direction = 180 - direction; // Reflect horizontally
}
if (y < 0) {
    direction = -direction; // Reflect vertically
}

// Check for collision with the paddle
if (place_meeting(x, y, obj_paddle)) {
    // Move the ball out of the paddle
    move_contact_solid(direction, speed);

    // Reflect the ball direction vertically
    direction = -direction;

    // Get the paddle's speed
    var paddle = instance_place(x, y, obj_paddle);
    if (paddle != noone) {
        // Adjust the ball's direction and speed based on the paddle's movement
        var paddle_speed = paddle.paddle_speed;

        // Change the direction based on where the ball hits the paddle
        var hit_pos = (x - paddle.x) / paddle.sprite_width;
        direction += hit_pos * 45; // Adjust the factor to control influence

        // Add some randomness to the bounce
        direction += irandom_range(-5, 5);

        // Increase speed slightly to make the game progressively harder
        speed += 0.1;
    }
	
}

// Check for collision with bricks
if (place_meeting(x, y, obj_brick)) {
    var brick = instance_place(x, y, obj_brick);
    if (brick != noone) {
        with (brick) {
            instance_destroy();
        }
        global.score += 10; // Update the score
		// Define a random pitch value between 0.5 and 1.5 (you can adjust this range as needed)
		var random_pitch = random_range(0.5, 1.5);

		// Play the sound snd_wow
		var sound_id = audio_play_sound(snd_wow, 0, false);

		// Set the pitch of the playing sound
		audio_sound_pitch(sound_id, random_pitch);
        direction = -direction; // Reflect vertically
    }
}

// Check if the ball falls below the paddle (game over condition)
if (y > room_height) {
    // Reset the game or end the game
    // For now, just restart the room
    room_restart();
}

// Check for victory condition
if (instance_number(obj_brick) == 0) {
    room_goto(rm_victory);
}
