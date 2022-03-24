#Map var
@pixel_scaler = 5

#Background
@map = Sprite.new('sprites\map_main.png',
    width: 500 * @pixel_scaler,
    height: 600 * @pixel_scaler,
    x: 0 * @pixel_scaler,
    y: 0 * @pixel_scaler
)

@fadeout = Sprite.new('sprites\fadeout.png',
    width: 500 * @pixel_scaler,
    height: 600 * @pixel_scaler,
    x: 0 * @pixel_scaler,
    y: 0 * @pixel_scaler
)
@fadeout.remove

@gameover_text = Sprite.new('sprites\gameover_text.png',
    width: 300 * @pixel_scaler,
    height: 180 * @pixel_scaler,
    x: 0 * @pixel_scaler,
    y: 0 * @pixel_scaler
)
@gameover_text.remove

@wall_col1 = Sprite.new('sprites\hit_collision.png',
    width: 191 * @pixel_scaler,
    height: 158 * @pixel_scaler,
    x: 0,
    y: 0,
    opacity: 0
)

@wall_col2 = Sprite.new('sprites\hit_collision.png',
    width: 45 * @pixel_scaler,
    height: 322 * @pixel_scaler,
    x: 0,
    y: 0,
    opacity: 0
)

@wall_col3 = Sprite.new('sprites\hit_collision.png',
    width: 129 * @pixel_scaler,
    height: 120 * @pixel_scaler,
    x: 0,
    y: 0,
    opacity: 0
)

@wall_col4 = Sprite.new('sprites\hit_collision.png',
    width: 371 * @pixel_scaler,
    height: 37 * @pixel_scaler,
    x: 0,
    y: 0,
    opacity: 0
)

@wall_col5 = Sprite.new('sprites\hit_collision.png',
    width: 24 * @pixel_scaler,
    height: 563 * @pixel_scaler,
    x: 0,
    y: 0,
    opacity: 0
)

@wall_col6 = Sprite.new('sprites\hit_collision.png',
    width: 285 * @pixel_scaler,
    height: 46 * @pixel_scaler,
    x: 0,
    y: 0,
    opacity: 0
)

@wall_col7 = Sprite.new('sprites\hit_collision.png',
    width: 40 * @pixel_scaler,
    height: 178 * @pixel_scaler,
    x: 0,
    y: 0,
    opacity: 0
)

@wall_col8 = Sprite.new('sprites\hit_collision.png',
    width: 90 * @pixel_scaler,
    height: 40 * @pixel_scaler,
    x: 0,
    y: 0,
    opacity: 0
)

@wall_col9 = Sprite.new('sprites\hit_collision.png',
    width: 40 * @pixel_scaler,
    height: 203 * @pixel_scaler,
    x: 0,
    y: 0,
    opacity: 0
)

@wall_col10 = Sprite.new('sprites\hit_collision.png',
    width: 158 * @pixel_scaler,
    height: 91 * @pixel_scaler,
    x: 0,
    y: 0,
    opacity: 0
)

@wall_col11 = Sprite.new('sprites\hit_collision.png',
    width: 131 * @pixel_scaler,
    height: 134 * @pixel_scaler,
    x: 0,
    y: 0,
    opacity: 0
)

@submap_col = Sprite.new('sprites\hit_collision.png',
    width: 370 * @pixel_scaler,
    height: 221 * @pixel_scaler,
    x: 0,
    y: 0,
    opacity: 0
)

@map_hitbox_test = Sprite.new('sprites\hit_collision.png',
    width: 40 * @pixel_scaler,
    height: 40 * @pixel_scaler,
    x: 1000 * @pixel_scaler,
    y: 5000 * @pixel_scaler
)

#Sprites
@player = Sprite.new('sprites\player_sprite.png',
    clip_width: 25,
    width: 25 * (@pixel_scaler-1),
    height: 25 * (@pixel_scaler-1),
    x: (300/2 - 12.5) * @pixel_scaler,
    y: (180/2 - 12.5) * @pixel_scaler,
    loop: false,
    time: 20,
    animations: {
        shoot: 0...4,
        death: 4...10,
        linger: 10..10,
    }
)


@player_hitbox = Sprite.new('sprites\hit_collision.png',
    width: 25 * (@pixel_scaler-1),
    height: 25 * (@pixel_scaler-1),
    x: (300/2 - 12.5) * @pixel_scaler,
    y: (180/2 - 12.5) * @pixel_scaler,
    loop: true,
    time: 100,
    opacity: 0
)

@bullet_1 = Sprite.new('sprites\bullet.png',
    width: 2 * (@pixel_scaler-1),
    height: 1 * (@pixel_scaler-1),
    x: 110,
    y: 100,
    loop: true,
    time: 100
)


@bullet_2 = Sprite.new('sprites\bullet.png',
    width: 2 * (@pixel_scaler-1),
    height: 1 * (@pixel_scaler-1),
    x: 110,
    y: 100,
    loop: true,
    time: 100
)

@bullet_3 = Sprite.new('sprites\bullet.png',
    width: 2 * (@pixel_scaler-1),
    height: 1 * (@pixel_scaler-1),
    x: 110,
    y: 100,
    loop: true,
    time: 100
)

#Från vänster til höger:sprite, walk dist, vilken rail, relativ x, relativ y, går fram eller tillbak, shoot tick, health, direction
@enemyarray = [
    [Sprite.new('sprites\enemy_sprite.png', clip_width: 25, width: 25 * (@pixel_scaler-1), height: 25 * (@pixel_scaler-1), x: 100, y: 50, loop: true, time: 100), 0, 1, 0, 0, 1, 80, 100, 0],
    [Sprite.new('sprites\enemy_sprite.png', clip_width: 25, width: 25 * (@pixel_scaler-1), height: 25 * (@pixel_scaler-1), x: 100, y: 50, loop: true, time: 100), 0, 2, 0, 0, 1, 80, 100, 0],
    [Sprite.new('sprites\enemy_sprite.png', clip_width: 25, width: 25 * (@pixel_scaler-1), height: 25 * (@pixel_scaler-1), x: 100, y: 50, loop: true, time: 100), 0, 3, 0, 0, 1, 80, 100, 0],
    [Sprite.new('sprites\enemy_sprite.png', clip_width: 25, width: 25 * (@pixel_scaler-1), height: 25 * (@pixel_scaler-1), x: 100, y: 50, loop: true, time: 100), 0, 4, 0, 0, 1, 80, 100, 0],
    [Sprite.new('sprites\enemy_sprite.png', clip_width: 25, width: 25 * (@pixel_scaler-1), height: 25 * (@pixel_scaler-1), x: 100, y: 50, loop: true, time: 100), 0, 5, 0, 0, 1, 80, 100, 9],
]

@enemy_death_array = []

@shooting_speed = 1

@submap = Sprite.new('sprites\map_sub.png',
    width: 500 * @pixel_scaler,
    height: 600 * @pixel_scaler,
    x: 0 * @pixel_scaler,
    y: 0 * @pixel_scaler,
    opacity: 0,
)

#static collision 
@wall_array = [
[@wall_col1, 309 * @pixel_scaler, 442 * @pixel_scaler], 
[@wall_col2, 455 * @pixel_scaler, 120 * @pixel_scaler], 
[@wall_col3, 371 * @pixel_scaler, 0 * @pixel_scaler],
[@wall_col4, 0 * @pixel_scaler, 0 * @pixel_scaler],
[@wall_col5, 0 * @pixel_scaler, 37 * @pixel_scaler],
[@wall_col6, 24 * @pixel_scaler, 554 * @pixel_scaler],
[@wall_col7, 222 * @pixel_scaler, 37 * @pixel_scaler],
[@wall_col8, 132 * @pixel_scaler, 175 * @pixel_scaler],
[@wall_col9, 222 * @pixel_scaler, 258 * @pixel_scaler],
[@wall_col10, 64 * @pixel_scaler, 334 * @pixel_scaler],
[@wall_col11, 262 * @pixel_scaler, 258 * @pixel_scaler],
[@submap_col, 23 * @pixel_scaler, 334 * @pixel_scaler]
]

# Gamemode/Gamestate
@difficulty_multiplier = [1,1] #0 HP, #1 Shooting speed
@gamemode = 1 #1 är easy, 2 är hard, 3 är doom
@gamestate = 0

#Player variables
@left = 0
@right = 0
@x_dir = 0
@flipped = false
@up = 0
@down = 0
@y_dir = 0
@walk_speed = 8
@hitbox_movement = 5
@hitbox_update = 0
@on_r = 0
@on_l = 0
@on_u = 0
@on_d = 0
@correction_x = 0
@correction_y = 0
@gun_selected = 1 #2 ak, 1 pistol, 0 inget

@player_x = @player.x - @map.x
@player_y = @player.y - @map.y 

@damaged_timer = 0
@damaged = false

@death_timer = 0 


#Bullet variables
@shooting = false
@bullet_1_x = 0
@bullet_1_y = 0
@bullet_2_x = 0 
@bullet_2_y = 0
@bullet_3_x = 0 
@bullet_3_y = 0
@bullet_array = [[@bullet_1, false, 0, 0, @bullet_1_x, @bullet_1_y], [@bullet_2, false, 0, 0, @bullet_2_x, @bullet_2_y], [@bullet_3, false, 0, 0, @bullet_3_x, @bullet_3_y]]
@bullet_speed = 20
@ak_frame_counter = 5 #Går neråt
@ak_shooting_on = 0
@ammo_mag_ak = 30
@ammo_total_ak = 120
@ammo_mag_pistol = 13
@ammo_total_pistol = 60
@reload = 0
@reload_time = 0
@bullet_hitbox_array = [@bullet_hitbox_1, @bullet_hitbox_2, @bullet_hitbox_3]

@enemy_bullet_array = []

#hit box varibles
@hitbox_array = [@map_hitbox_test]
@characters_array = [@player_hitbox]
@hit_collision_test = 0
@map_hitbox_test_x = 50
@map_hitbox_test_y = -50

# Här kommer kod för att skriva ut info på skärmen (typ debugging)
@text = Text.new(
    ""
)

@text_ammo_mag_pistol = Text.new(
    ""
)

@text_ammo_total_pistol = Text.new(
    ""
)

@text_ammo_mag_ak = Text.new(
    ""
)

@text_ammo_total_ak = Text.new(
    ""
)


#HUD
@hud = Sprite.new('sprites\Hud.png',
    width: 300 * @pixel_scaler,
    height: 180 * @pixel_scaler,
    x: 0,
    y: 0
)

@health_bar = Sprite.new('sprites\healthbar.png',
    clip_width: 31,
    width: 31 * @pixel_scaler * 1.5,
    height: 8 * @pixel_scaler * 1.5,
    x: 90,
    y: 165 * @pixel_scaler,
    loop: true,
    animations: {
        "ten": 0..0,
        "nine": 1..1,
        "eight": 2..2,
        "seven": 3..3,
        "six": 4..4,
        "five": 5..5,
        "four": 6..6,
        "three": 7..7,
        "two": 8..8,
        "one": 9..9,
        "zero": 10..10
    }
)
@health_bar_array = ["ten", "nine", "eight", "seven", "six", "five", "four", "three", "two", "one", "zero"]
@health_index = 0

@pistol_siluette = Sprite.new('sprites/pistol_siluette.png',
    width: 20 * @pixel_scaler,
    height: 9 * @pixel_scaler, 
    x: 240 * @pixel_scaler,
    y: 165 * @pixel_scaler,
    loop: true
)

@ak_siluette = Sprite.new('sprites/ak_siluette.png',
    width: 20 * @pixel_scaler,
    height: 9 * @pixel_scaler, 
    x: 240 * @pixel_scaler,
    y: 165 * @pixel_scaler,
    loop: true
)


#music

@shoot_sfx = Sound.new('music&sfx\shoot.mp3')
@menu_theme = Music.new('music&sfx\track1.wav')
@game_theme = Music.new('music&sfx\track2.wav')
@music_tick = 0

 