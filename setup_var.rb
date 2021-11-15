#Sprites
@player = Sprite.new('sprites\player_sprite.png',
    clip_width: 24,
    width: 24,
    height: 24,
    x: 100,
    y: 100,
    loop: true,
    time: 100,
)

@bullet = Sprite.new('sprites\bullet.png',
    width: 24,
    height: 24,
    x: 110,
    y: 100,
    loop: true,
    time: 100
)
@bullet_hitbox = Sprite.new('sprites\hit_collision.png',
width: 2,
height: 1,
x: 110,
y: 100,
)


@left = 0
@right = 0
@x_dir = 0
@flipped = false
@up = 0
@down = 0
@y_dir = 0
@walk_speed = 1.5

@bullet_speed = 10

# Här kommer kod för att skriva ut info på skärmen (typ debugging)
@text = Text.new(
    ""
)
