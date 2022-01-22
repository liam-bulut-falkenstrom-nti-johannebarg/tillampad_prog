@main_menu = true

@startup_map = Sprite.new('sprites\startup_map.png',
    width: 300 * @pixel_scaler,
    height: 180 * @pixel_scaler,
    x: 0,
    y: 0
)

@button_play = Sprite.new('sprites\button_play.png',
    clip_width: 36,
    width: 72 * @pixel_scaler,
    height: 22 * @pixel_scaler,
    x: 60 * @pixel_scaler,
    y: 60 * @pixel_scaler,
    loop: true,
    animations: {
        normal: 0..0,
        hover: 1..1,
    }
)

@button_settings = Sprite.new('sprites\button_settings.png',
    clip_width: 36,
    width: 72 * @pixel_scaler,
    height: 22 * @pixel_scaler,
    x: 60 * @pixel_scaler,
    y: 90 * @pixel_scaler,
    loop: true,
    animations: {
        normal: 0..0,
        hover: 1..1,
    }
)

@button_exit = Sprite.new('sprites\button_exit.png',
    clip_width: 36,
    width: 72 * @pixel_scaler,
    height: 22 * @pixel_scaler,
    x: 60 * @pixel_scaler,
    y: 120 * @pixel_scaler,
    loop: true,
    animations: {
        normal: 0..0,
        hover: 1..1,
    }
)

@button_easy = Sprite.new('sprites\button_easy.png',
    clip_width: 36,
    width: 72 * @pixel_scaler,
    height: 22 * @pixel_scaler,
    x: 60 * @pixel_scaler,
    y: 60 * @pixel_scaler,
    loop: true,
    animations: {
        normal: 0..0,
        hover: 1..1,
    }
)
@button_easy.remove

@button_hard = Sprite.new('sprites\button_hard.png',
    clip_width: 36,
    width: 72 * @pixel_scaler,
    height: 22 * @pixel_scaler,
    x: 60 * @pixel_scaler,
    y: 90 * @pixel_scaler,
    loop: true,
    animations: {
        normal: 0..0,
        hover: 1..1,
    }
)
@button_hard.remove

@button_doom = Sprite.new('sprites\button_doom.png',
    clip_width: 36,
    width: 72 * @pixel_scaler,
    height: 22 * @pixel_scaler,
    x: 60 * @pixel_scaler,
    y: 120 * @pixel_scaler,
    loop: true,
    animations: {
        normal: 0..0,
        hover: 1..1,
    }
)
@button_doom.remove

@button_array = [@button_play, @button_settings, @button_exit, @button_easy, @button_hard, @button_doom]

@click = false

@settings = false