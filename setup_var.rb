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

@bullet = Sprite.new('sprites\bullet.png',
    width: 4,
    height: 4,
    x: 110,
    y: 100,
    loop: true,
    time: 100
)

@left = 0
@right = 0
@x_dir = 0
@flipped = false
@up = 0
@down = 0
@y_dir = 0
@walk_speed = 1.5

# Här kommer kod för att skriva ut info på skärmen (typ debugging)
@text = Text.new(
    ""
)
