#Map var
@pixel_scaler = 5

#Background
@map = Image.new('sprites\map_main.png',
    width: 500 * @pixel_scaler,
    height: 600 * @pixel_scaler,
    x: 0 * @pixel_scaler,
    y: 0 * @pixel_scaler,
)

@box = Sprite.new('sprites\box.png',
    width: 34 * @pixel_scaler,
    height: 34 * @pixel_scaler,
    x: -150,
    y: -180,
)

@map_hitbox_test = Sprite.new('sprites\hit_collision.png',
    width: 40 * @pixel_scaler,
    height: 40 * @pixel_scaler,
    x: 70 * @pixel_scaler,
    y: 50 * @pixel_scaler

)

#Sprites
@player = Sprite.new('sprites\player_sprite.png',
    clip_width: 25,
    width: 25 * @pixel_scaler,
    height: 25 * @pixel_scaler,
    x: (200/2 - 12.5) * @pixel_scaler,
    y: (120/2 - 12.5) * @pixel_scaler,
    loop: true,
    time: 100,
)

@enemy_1 = Sprite.new('sprites\enemy_sprite.png',
    clip_width: 25,
    width: 25 * @pixel_scaler,
    height: 25 * @pixel_scaler,
    x: 100,
    y: 50,
    loop: true,
    time: 100,
)

@bullet_1 = Sprite.new('sprites\bullet.png',
    width: 2 * @pixel_scaler,
    height: 1 * @pixel_scaler,
    x: 110,
    y: 100,
    loop: true,
    time: 100
)

@bullet_2 = Sprite.new('sprites\bullet.png',
    width: 2 * @pixel_scaler,
    height: 1 * @pixel_scaler,
    x: 110,
    y: 100,
    loop: true,
    time: 100
)

@bullet_3 = Sprite.new('sprites\bullet.png',
    width: 2 * @pixel_scaler,
    height: 1 * @pixel_scaler,
    x: 110,
    y: 100,
    loop: true,
    time: 100
)

@bullet_hitbox_1 = Sprite.new('sprites\hit_collision.png',
width: 2 * @pixel_scaler,
height: 1 * @pixel_scaler,
x: 110,
y: 100,
)

@bullet_hitbox_2 = Sprite.new('sprites\hit_collision.png',
width: 2 * @pixel_scaler,
height: 1 * @pixel_scaler,
x: 110,
y: 100,
)

@bullet_hitbox_3 = Sprite.new('sprites\hit_collision.png',
width: 2 * @pixel_scaler,
height: 1 * @pixel_scaler,
x: 110,
y: 100,
)



#Player variables
@left = 0
@right = 0
@x_dir = 0
@flipped = false
@up = 0
@down = 0
@y_dir = 0
@walk_speed = 8

#Enemy 1 variables
@enemy_array = [[@enemy_1, 0]]
@enemy_1_hit = 0


#Bullet variables
@bullet_array = [[@bullet_1, false, 0, 0], [@bullet_2, false, 0, 0], [@bullet_3, false, 0, 0]]
@bullet_speed = 10
@ammo_mag = 30
@ammo_total = 120
@reload = 0
@reload_time = 0
@bullet_hitbox_array = [@bullet_hitbox_1, @bullet_hitbox_2, @bullet_hitbox_3]
@bullet_x = 0
@bullet_y = 0

#hit box varibles
@hitbox_array = [@map_hitbox_test]
@characters_array = [@player, @enemy_1]
@hit_collision_test = 0

# Här kommer kod för att skriva ut info på skärmen (typ debugging)
@text = Text.new(
    ""
)

#HUD
@hud = Sprite.new('sprites\Hud.png',
    width: 200 * @pixel_scaler,
    height: 120 * @pixel_scaler,
    x: 0,
    y: 0,
    loop: true,
    time: 100,
)

# @hbar_d = Sprite.new('sprites\health_bar_dead.png'

# )

# @hbar_d_1 = Sprite.new('sprites\health_bar_dead.png',
#     width: 4 * @pixel_scaler,
#     height: 8 * @pixel_scaler,
#     x: 12 * @pixel_scaler,
#     y: 110 * @pixel_scaler,
#     loop: true,
#     time: 100,
# )

# @hbar_d_2 = Sprite.new('sprites\health_bar_dead.png',
#     width: 4 * @pixel_scaler,
#     height: 8 * @pixel_scaler,
#     x: 15 * @pixel_scaler,
#     y: 110 * @pixel_scaler,
#     loop: true,
#     time: 100,
# )

# @hbar_d_3 = Sprite.new('sprites\health_bar_dead.png',
#     width: 4 * @pixel_scaler,
#     height: 8 * @pixel_scaler,
#     x: 18 * @pixel_scaler,
#     y: 110 * @pixel_scaler,
#     loop: true,
#     time: 100,
# )

# @hbar_d_4 = Sprite.new('sprites\health_bar_dead.png',
#     width: 4 * @pixel_scaler,
#     height: 8 * @pixel_scaler,
#     x: 21 * @pixel_scaler,
#     y: 110 * @pixel_scaler,
#     loop: true,
#     time: 100,
# )

# @hbar_d_5 = Sprite.new('sprites\health_bar_dead.png',
#     width: 4 * @pixel_scaler,
#     height: 8 * @pixel_scaler,
#     x: 24 * @pixel_scaler,
#     y: 110 * @pixel_scaler,
#     loop: true,
#     time: 100,
# )

# @hbar_d_6 = Sprite.new('sprites\health_bar_dead.png',
#     width: 4 * @pixel_scaler,
#     height: 8 * @pixel_scaler,
#     x: 27 * @pixel_scaler,
#     y: 110 * @pixel_scaler,
#     loop: true,
#     time: 100,
# )

# @hbar_d_7 = Sprite.new('sprites\health_bar_dead.png',
#     width: 4 * @pixel_scaler,
#     height: 8 * @pixel_scaler,
#     x: 30 * @pixel_scaler,
#     y: 110 * @pixel_scaler,
#     loop: true,
#     time: 100,
# )

# @hbar_d_8 = Sprite.new('sprites\health_bar_dead.png',
#     width: 4 * @pixel_scaler,
#     height: 8 * @pixel_scaler,
#     x: 33 * @pixel_scaler,
#     y: 110 * @pixel_scaler,
#     loop: true,
#     time: 100,
# )

# @hbar_d_9 = Sprite.new('sprites\health_bar_dead.png',
#     width: 4 * @pixel_scaler,
#     height: 8 * @pixel_scaler,
#     x: 36 * @pixel_scaler,
#     y: 110 * @pixel_scaler,
#     loop: true,
#     time: 100,
# )

# @hbar_d_10 = Sprite.new('sprites\health_bar_dead.png',
#     width: 4 * @pixel_scaler,
#     height: 8 * @pixel_scaler,
#     x: 39 * @pixel_scaler,
#     y: 110 * @pixel_scaler,
#     loop: true,
#     time: 100,
# )

# @hbar_h_1 = Sprite.new('sprites\health_bar_half.png',
#     width: 4 * @pixel_scaler,
#     height: 8 * @pixel_scaler,
#     x: 12 * @pixel_scaler,
#     y: 110 * @pixel_scaler,
#     loop: true,
#     time: 100,
# )

# @hbar_h_2 = Sprite.new('sprites\health_bar_half.png',
#     width: 4 * @pixel_scaler,
#     height: 8 * @pixel_scaler,
#     x: 15 * @pixel_scaler,
#     y: 110 * @pixel_scaler,
#     loop: true,
#     time: 100,
# )

# @hbar_h_3 = Sprite.new('sprites\health_bar_half.png',
#     width: 4 * @pixel_scaler,
#     height: 8 * @pixel_scaler,
#     x: 18 * @pixel_scaler,
#     y: 110 * @pixel_scaler,
#     loop: true,
#     time: 100,
# )

# @hbar_h_4 = Sprite.new('sprites\health_bar_half.png',
#     width: 4 * @pixel_scaler,
#     height: 8 * @pixel_scaler,
#     x: 21 * @pixel_scaler,
#     y: 110 * @pixel_scaler,
#     loop: true,
#     time: 100,
# )

# @hbar_h_5 = Sprite.new('sprites\health_bar_half.png',
#     width: 4 * @pixel_scaler,
#     height: 8 * @pixel_scaler,
#     x: 24 * @pixel_scaler,
#     y: 110 * @pixel_scaler,
#     loop: true,
#     time: 100,
# )

# @hbar_h_6 = Sprite.new('sprites\health_bar_half.png',
#     width: 4 * @pixel_scaler,
#     height: 8 * @pixel_scaler,
#     x: 27 * @pixel_scaler,
#     y: 110 * @pixel_scaler,
#     loop: true,
#     time: 100,
# )

# @hbar_h_7 = Sprite.new('sprites\health_bar_half.png',
#     width: 4 * @pixel_scaler,
#     height: 8 * @pixel_scaler,
#     x: 30 * @pixel_scaler,
#     y: 110 * @pixel_scaler,
#     loop: true,
#     time: 100,
# )

# @hbar_h_8 = Sprite.new('sprites\health_bar_half.png',
#     width: 4 * @pixel_scaler,
#     height: 8 * @pixel_scaler,
#     x: 33 * @pixel_scaler,
#     y: 110 * @pixel_scaler,
#     loop: true,
#     time: 100,
# )

# @hbar_h_9 = Sprite.new('sprites\health_bar_half.png',
#     width: 4 * @pixel_scaler,
#     height: 8 * @pixel_scaler,
#     x: 36 * @pixel_scaler,
#     y: 110 * @pixel_scaler,
#     loop: true,
#     time: 100,
# )

# @hbar_h_10 = Sprite.new('sprites\health_bar_half.png',
#     width: 4 * @pixel_scaler,
#     height: 8 * @pixel_scaler,
#     x: 39 * @pixel_scaler,
#     y: 110 * @pixel_scaler,
#     loop: true,
#     time: 100,
# )

# @hbar_f_1 = Sprite.new('sprites\health_bar_full.png',
#     width: 4 * @pixel_scaler,
#     height: 8 * @pixel_scaler,
#     x: 12 * @pixel_scaler,
#     y: 110 * @pixel_scaler,
#     loop: true,
#     time: 100,
# )

# @hbar_f_2 = Sprite.new('sprites\health_bar_full.png',
#     width: 4 * @pixel_scaler,
#     height: 8 * @pixel_scaler,
#     x: 15 * @pixel_scaler,
#     y: 110 * @pixel_scaler,
#     loop: true,
#     time: 100,
# )

# @hbar_f_3 = Sprite.new('sprites\health_bar_full.png',
#     width: 4 * @pixel_scaler,
#     height: 8 * @pixel_scaler,
#     x: 18 * @pixel_scaler,
#     y: 110 * @pixel_scaler,
#     loop: true,
#     time: 100,
# )

# @hbar_f_4 = Sprite.new('sprites\health_bar_full.png',
#     width: 4 * @pixel_scaler,
#     height: 8 * @pixel_scaler,
#     x: 21 * @pixel_scaler,
#     y: 110 * @pixel_scaler,
#     loop: true,
#     time: 100,
# )

# @hbar_f_5 = Sprite.new('sprites\health_bar_full.png',
#     width: 4 * @pixel_scaler,
#     height: 8 * @pixel_scaler,
#     x: 24 * @pixel_scaler,
#     y: 110 * @pixel_scaler,
#     loop: true,
#     time: 100,
# )

# @hbar_f_6 = Sprite.new('sprites\health_bar_full.png',
#     width: 4 * @pixel_scaler,
#     height: 8 * @pixel_scaler,
#     x: 27 * @pixel_scaler,
#     y: 110 * @pixel_scaler,
#     loop: true,
#     time: 100,
# )

# @hbar_f_7 = Sprite.new('sprites\health_bar_full.png',
#     width: 4 * @pixel_scaler,
#     height: 8 * @pixel_scaler,
#     x: 30 * @pixel_scaler,
#     y: 110 * @pixel_scaler,
#     loop: true,
#     time: 100,
# )

# @hbar_f_8 = Sprite.new('sprites\health_bar_full.png',
#     width: 4 * @pixel_scaler,
#     height: 8 * @pixel_scaler,
#     x: 33 * @pixel_scaler,
#     y: 110 * @pixel_scaler,
#     loop: true,
#     time: 100,
# )

# @hbar_f_9 = Sprite.new('sprites\health_bar_full.png',
#     width: 4 * @pixel_scaler,
#     height: 8 * @pixel_scaler,
#     x: 36 * @pixel_scaler,
#     y: 110 * @pixel_scaler,
#     loop: true,
#     time: 100,
# )

# @hbar_f_10 = Sprite.new('sprites\health_bar_full.png',
#     width: 4 * @pixel_scaler,
#     height: 8 * @pixel_scaler,
#     x: 39 * @pixel_scaler,
#     y: 110 * @pixel_scaler,
#     loop: true,
#     time: 100,
# )