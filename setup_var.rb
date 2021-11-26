#Background
@map = Image.new('sprites\map_main.png',
    width: 500,
    height: 600,
    x: -80,
    y: -120,
)

@box = Image.new('sprites\box.png',
    width: 34,
    height: 34,
    x: -150,
    y: -180,
)


#Sprites
@player = Sprite.new('sprites\player_sprite.png',
    clip_width: 16,
    width: 16,
    height: 16,
    x: 100,
    y: 100,
    loop: true,
    time: 100,
)

@enemy_1 = Sprite.new('sprites\enemy_sprite.png',
    clip_width: 20,
    width: 20,
    height: 20,
    x: 100,
    y: 50,
    loop: true,
    time: 100,
)

@bullet_1 = Sprite.new('sprites\bullet.png',
    width: 16,
    height: 16,
    x: 110,
    y: 100,
    loop: true,
    time: 100
)

@bullet_hitbox_1 = Sprite.new('sprites\hit_collision.png',
width: 2,
height: 1,
x: 110,
y: 100,
)


@bullet_2 = Sprite.new('sprites\bullet.png',
    width: 16,
    height: 16,
    x: 110,
    y: 100,
    loop: true,
    time: 100
)

@bullet_hitbox_2 = Sprite.new('sprites\hit_collision.png',
width: 2,
height: 1,
x: 110,
y: 100,
)

@bullet_3 = Sprite.new('sprites\bullet.png',
    width: 16,
    height: 16,
    x: 110,
    y: 100,
    loop: true,
    time: 100
)

@bullet_hitbox_3 = Sprite.new('sprites\hit_collision.png',
width: 2,
height: 1,
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
@walk_speed = 1.5

#Enemy 1 variabled
@enemy_array = [[@enemy_1, 0]]
@enemy_1_hit = 0

#Bullet variables
@bullet_array = [[@bullet_1, false, 0, 0], [@bullet_2, false, 0, 0], [@bullet_3, false, 0, 0]]
@bullet_speed = 1
@ammo_mag = 30
@ammo_total = 120
@reload = 0
@reload_time = 0
@bullet_hitbox_array = [@bullet_hitbox_1, @bullet_hitbox_2, @bullet_hitbox_3]

# Här kommer kod för att skriva ut info på skärmen (typ debugging)
@text = Text.new(
    ""
)
