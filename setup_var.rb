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


#Sprites
@player = Sprite.new('sprites\player_sprite.png',
    clip_width: 25,
    width: 25 * @pixel_scaler,
    height: 25 * @pixel_scaler,
    x: Window.width/2,
    y: Window.height/2,
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

#Enemy 1 variabled
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

# Här kommer kod för att skriva ut info på skärmen (typ debugging)
@text = Text.new(
    ""
)
