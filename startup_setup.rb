@main_menu = true

@startup_map = Sprite.new('sprites\startup_map.png',
    width: 300 * @pixel_scaler,
    height: 180 * @pixel_scaler,
    x: 0,
    y: 0
)

@button_play = Sprite.new('sprites\button_play.png',
    clip_width: 36,
    width: 65 * @pixel_scaler,
    height: 20 * @pixel_scaler,
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
    width: 65 * @pixel_scaler,
    height: 20 * @pixel_scaler,
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
    width: 65 * @pixel_scaler,
    height: 20 * @pixel_scaler,
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
    width: 65 * @pixel_scaler,
    height: 20 * @pixel_scaler,
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
    width: 65 * @pixel_scaler,
    height: 20 * @pixel_scaler,
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
    width: 65 * @pixel_scaler,
    height: 20 * @pixel_scaler,
    x: 60 * @pixel_scaler,
    y: 120 * @pixel_scaler,
    loop: true,
    animations: {
        normal: 0..0,
        hover: 1..1,
    }
)
@button_doom.remove

@button_controls = Sprite.new('sprites\button_controls_combine.png',
    clip_width: 36,
    width: 65 * @pixel_scaler,
    height: 20 * @pixel_scaler,
    x: 60 * @pixel_scaler,
    y: 60 * @pixel_scaler,
    loop: true,
    animations: {
        normal: 0..0,
        hover: 1..1,
    }
)
@button_controls.remove

@button_volume = Sprite.new('sprites\button_volume_combine.png',
    clip_width: 36,
    width: 65 * @pixel_scaler,
    height: 20 * @pixel_scaler,
    x: 60 * @pixel_scaler,
    y: 80 * @pixel_scaler,
    loop: true,
    animations: {
        normal: 0..0,
        hover: 1..1,
    }
)
@button_volume.remove

@button_credits = Sprite.new('sprites\button_credits_combine.png',
    clip_width: 36,
    width: 65 * @pixel_scaler,
    height: 20 * @pixel_scaler,
    x: 60 * @pixel_scaler,
    y: 100 * @pixel_scaler,
    loop: true,
    animations: {
        normal: 0..0,
        hover: 1..1,
    }
)
@button_credits.remove

@button_return_settings = Sprite.new('sprites\button_return_combine_settings.png',
    clip_width: 36,
    width: 65 * @pixel_scaler,
    height: 20 * @pixel_scaler,
    x: 60 * @pixel_scaler,
    y: 120 * @pixel_scaler,
    loop: true,
    animations: {
        normal: 0..0,
        hover: 1..1,
    }
)
@button_return_settings.remove

@button_return_volume = Sprite.new('sprites\button_return_combine_volume.png',
    clip_width: 36,
    width: 65 * @pixel_scaler,
    height: 20 * @pixel_scaler,
    x: 60 * @pixel_scaler,
    y: 120 * @pixel_scaler,
    loop: true,
    animations: {
        normal: 0..0,
        hover: 1..1,
    }
)
@button_return_volume.remove


@button_soundon = Sprite.new('sprites\button_soundsymbol.png',
    width: 20 * @pixel_scaler,
    height: 20 * @pixel_scaler,
    x: 60 * @pixel_scaler,
    y: 80 * @pixel_scaler,
)
@button_soundon.remove

@button_soundoff = Sprite.new('sprites\button_soundsymbol_crossed.png',
    width: 20 * @pixel_scaler,
    height: 20 * @pixel_scaler,
    x: 105 * @pixel_scaler,
    y: 80 * @pixel_scaler,
)
@button_soundoff.remove

@hud_credits = Sprite.new('sprites\hud_credits.png',
    width: 300 * @pixel_scaler,
    height: 180 * @pixel_scaler,
    x: 0,
    y: 0
)
@hud_credits.remove

@hud_controls = Sprite.new('sprites\hud_controls.png',
    width: 300 * @pixel_scaler,
    height: 180 * @pixel_scaler,
    x: 0,
    y: 0
)
@hud_controls.remove

@button_cross_credits = Sprite.new('sprites\button_crossed_credits.png',
    width: 10 * @pixel_scaler,
    height: 10 * @pixel_scaler,
    x: 285 * @pixel_scaler,
    y: 4 * @pixel_scaler,
)
@button_cross_credits.remove

@button_cross_controls = Sprite.new('sprites\button_crossed_controls.png',
    width: 10 * @pixel_scaler,
    height: 10 * @pixel_scaler,
    x: 285 * @pixel_scaler,
    y: 3 * @pixel_scaler,
)
@button_cross_controls.remove

@button_array = [@button_play, @button_settings, @button_exit, @button_easy, @button_hard, @button_doom, @button_controls, @button_volume, @button_credits, @button_return_settings, @button_return_volume, @button_cross_credits, @button_cross_controls, @button_soundon, @button_soundoff]

@click = false

@settings = false

@play = false

@credits = false

@volume = false

@controls = false

@mute = false

@mute_active = 0