require 'ruby2d'
require_relative "setup_var.rb"
require_relative "help_functions.rb"
require_relative "startup_setup.rb"

set width: 300 * @pixel_scaler
set height: 180 * @pixel_scaler
set fullscreen: true

on :key_held do |event|
    case event.key
        when 'd'
            @right = 1
        when 'a'
            @left = 1
        when 'w'
            @up = 1
        when 's'
            @down = 1
        when 'r'
            if @gun_selected == 1 && @ammo_total_pistol >= 13
                @reload = 1
            elsif @gun_selected == 2 && @ammo_total_ak >= 30
                @reload = 1
            end
        when '1'
            @gun_selected = 1
        when '2'
            @gun_selected = 2
    end     
end

on :key_up do |event|
    case event.key
        when 'd'
            @right = 0
        when 'a'
            @left = 0
        when 'w'
            @up = 0
        when 's'
            @down = 0
    end     
end

on :mouse_down do |event|
    case event.button
    when :left
    if @gamestate == 1
        if @ammo_mag_pistol > 0 && @gun_selected == 1
            @shooting = true
        end
        if @ammo_mag_ak > 0 && @gun_selected == 2
            @ak_shooting_on = 1
            @shooting = true
        end
    elsif @gamestate == 0
        @click = true
    end
    when :middle

    when :right

    end
end

on :key_down do |event|
    if @gamestate == 2 || @gamestate == 3 && @death_timer > 30
        exit
    end
end

on :mouse_up do |event|
    case event.button
    when :left
        if @ak_shooting_on == 1
            @ak_shooting_on = 0
        end
    when :middle

    when :right

    end
end

i = 0
j = 0

update do
    if @gamestate == 0
        if @music_tick == 0
            @menu_theme.play
            @music_tick += 1
        end 

        if @mute == true && @mute_active == 0
            @menu_theme.pause
            @mute_active = 1
        elsif @mute == false && @mute_active == 1
            @menu_theme.play
            @mute_active = 0
        end

        mousex = get :mouse_x
        mousey = get :mouse_y

        
        
        i = 0
        while i < @button_array.length
            if hover(mousex, mousey, @button_array[i])
                @button_array[i].play animation: :hover
                if @click
                    if i == 0 && @main_menu == true
                        @play = true
                        i = @button_array.length
                        @main_menu = false
                        @settings = false
                        @credits = false
                        @volume = false
                        @controls = false
                    elsif i == 1 && @main_menu == true
                        @settings = true
                        i = @button_array.length
                        @main_menu = false
                        @play = false
                        @credits = false
                        @volume = false
                        @controls = false
                    elsif i == 2 && @main_menu == true
                        exit
                    elsif i == 3 && @play == true
                        @gamemode = 1
                        @gamestate = 1
                        i = @button_array.length
                    elsif i == 4 && @play == true
                        @gamemode = 2
                        @gamestate = 1
                        i = @button_array.length
                    elsif i == 5 && @play == true
                        @gamemode = 3
                        @gamestate = 1
                        i = @button_array.length
                    elsif i == 6 && @settings == true
                        @controls = true
                        i = @button_array.length
                        @credits = false
                        @settings = false
                        @play = false
                        @main_menu = false
                        @volume = false
                    elsif i == 7 && @settings == true
                        @volume = true
                        i = @button_array.length
                        @credits = false
                        @settings = false
                        @play = false
                        @main_menu = false
                        @controls = false
                    elsif i == 8 && @settings == true
                        @credits = true
                        i = @button_array.length
                        @settings = false
                        @play = false
                        @main_menu = false
                        @controls = false
                        @volume = false
                    elsif i == 9 && @settings == true 
                        @main_menu = true
                        i = @button_array.length
                        @play = false
                        @settings = false
                        @credits = false
                        @volume = false
                        @controls = false
                    elsif i == 10 && @volume == true
                        @settings = true
                        i = @button_array.length
                        @play = false
                        @credits = false
                        @volume = false
                        @controls = false
                        @main_menu = false
                    elsif i == 11 && @credits == true
                        @settings = true
                        i = @button_array.length
                        @play = false
                        @main_menu = false
                        @credits = false
                        @volume = false
                        @controls = false
                    elsif i == 12 && @controls == true
                        @settings = true
                        i = @button_array.length
                        @play = false
                        @main_menu = false
                        @credits = false
                        @volume = false
                        @controls = false
                    elsif i == 13 && @volume == true
                        i = @button_array.length
                        @mute = false
                    elsif i == 14 && @volume == true
                        i = @button_array.length
                        @mute = true
                    end
                end
            else
                @button_array[i].play animation: :normal
            end
            i += 1
        end

        if @main_menu == true
            @button_play.add
            @button_settings.add
            @button_exit.add
            @button_return_settings.remove
            @button_return_volume.remove
            @hud_credits.remove
            @button_easy.remove
            @button_hard.remove
            @button_doom.remove
            @button_controls.remove
            @button_volume.remove
            @button_credits.remove
            @button_cross_credits.remove
            @button_cross_controls.remove
            @button_soundon.remove
            @button_soundoff.remove
            @hud_controls.remove
        elsif @settings == true
            @button_controls.add
            @button_volume.add
            @button_credits.add
            @button_return_settings.add
            @button_return_volume.remove
            @hud_credits.remove
            @button_easy.remove
            @button_hard.remove
            @button_doom.remove
            @button_play.remove
            @button_settings.remove
            @button_exit.remove
            @button_cross_credits.remove
            @button_cross_controls.remove
            @button_soundon.remove
            @button_soundoff.remove
            @hud_controls.remove
        elsif @play == true
            @button_easy.add
            @button_hard.add
            @button_doom.add
            @button_return_volume.remove
            @button_return_settings.remove
            @hud_credits.remove
            @button_controls.remove
            @button_volume.remove
            @button_credits.remove
            @button_play.remove
            @button_settings.remove
            @button_exit.remove
            @button_cross_credits.remove
            @button_cross_controls.remove
            @button_soundon.remove
            @button_soundoff.remove
            @hud_controls.remove
        elsif @controls == true
            @hud_controls.add
            @button_cross_controls.add
            @button_return_volume.remove
            @button_return_settings.remove
            @button_cross_credits.remove
            @button_soundon.remove
            @button_soundoff.remove
            @hud_credits.remove
            @button_easy.remove
            @button_hard.remove
            @button_doom.remove
            @button_controls.remove
            @button_volume.remove
            @button_credits.remove
            @button_play.remove
            @button_settings.remove
            @button_exit.remove
        elsif @credits == true
            @hud_credits.add
            @button_cross_credits.add
            @button_cross_controls.remove
            @button_return_volume.remove
            @button_return_settings.remove
            @button_easy.remove
            @button_hard.remove
            @button_doom.remove
            @button_controls.remove
            @button_volume.remove
            @button_credits.remove
            @button_play.remove
            @button_settings.remove
            @button_exit.remove
            @button_soundon.remove
            @button_soundoff.remove
            @hud_controls.remove
        elsif @volume == true
            @button_soundon.add
            @button_soundoff.add
            @button_return_volume.add
            @button_return_settings.remove
            @button_cross_credits.remove
            @button_cross_controls.remove
            @hud_credits.remove
            @button_easy.remove
            @button_hard.remove
            @button_doom.remove
            @button_controls.remove
            @button_volume.remove
            @button_credits.remove
            @button_play.remove
            @button_settings.remove
            @button_exit.remove
            @hud_controls.remove
        end
        @click = false
    elsif @gamestate == 1
        @startup_map.remove
        i = 0
        while i < @button_array.length
            @button_array[i].remove
            i += 1
        end
        if @music_tick == 1
            if @mute != true
                @game_theme.play
                @game_theme.volume = 40
            end
            @music_tick += 1
        end
        @game_theme.loop = true

        # Shooting --------------------------------------------------------

        mousex = get :mouse_x
        mousey = get :mouse_y
        player_center_array = [(@player.x + @player.width/2), (@player.y + @player.height/2)] # Kan komma att ändras i och med att mittpunkten för sprites skiljer sig. 
        rotate_angle = mouse_angle(mousex, mousey, player_center_array)[0]
        unit_vector = mouse_angle(mousex, mousey, player_center_array)[1]
        dist_array = mouse_angle(mousex, mousey, [150.137*@pixel_scaler, 90.137*@pixel_scaler])[2] #float för att undvika zero division
        if (@right - @left).abs == (@down - @up).abs
            @x_dir = (@right - @left) * 0.70 # typ roten ur 2 dividerat på 2 (cirkelns ekvation)
            @y_dir = (@down - @up) * 0.70 
        else
            @x_dir = (@right - @left) 
            @y_dir = (@down - @up)
        end 

        if @shooting
            i = 0
            while i < @bullet_array.length  
                if @bullet_array[i][1] == false
                    
                    @bullet_array[i][0].rotate = rotate_angle
                    @bullet_array[i][1] = true
                    @bullet_array[i][2] = unit_vector[0]
                    @bullet_array[i][3] = unit_vector[1]
                    @bullet_array[i][4] = (@player.x - @map.x  + @player.width/2).abs
                    @bullet_array[i][5] = (@player.y - @map.y + @player.height/2).abs
                    if @gun_selected == 1
                        @ammo_mag_pistol -= 1
                    elsif @gun_selected == 2
                        @ammo_mag_ak -= 1
                    end
                    i = @bullet_array.length
                    @player.play animation: :shoot
                    @shoot_sfx.play
                end
                i += 1
            end
            @shooting = false
        end

        @player.rotate = rotate_angle

        #reaload ----------------------------------------------------
    
        if @reload == 1
            @reload_time += 1
            if @reload_time >= 60
                if @gun_selected == 1
                    @ammo_mag_pistol = 13
                    @ammo_total_pistol -= 13
                    @reload = 0
                    @reload_time = 0
                elsif @gun_selected == 2
                    @ammo_mag_ak = 30
                    @ammo_total_ak -= 30
                    @reload = 0
                    @reload_time = 0
                end
            end
        end

        if @ammo_mag_ak > 0 && @gun_selected == 2 && @ak_frame_counter <= 0 && @ak_shooting_on == 1
            @shoot_sfx.play
            @ak_frame_counter = 5
            @shooting = true
        elsif @ammo_mag_ak > 0 && @gun_selected == 2 && @ak_frame_counter != 0 && @ak_shooting_on == 1
            @ak_frame_counter -= 1
        end

        #difficulty multiplier ---------------------------------------------------
        
        if @gamemode == 1 #Easy
            i = 0
            @difficulty_multiplier[0] = 1
            @difficulty_multiplier[1] = 1
            while i < @enemyarray.length
                @enemyarray[i][7] = 100 * @difficulty_multiplier[0] #HP 
                @shooting_speed = 1 * @difficulty_multiplier[1] #Shooting speed
                i += 1
            end
            i = 0
            @gamemode = 0
        elsif @gamemode == 2 #Hard
            i = 0
            @difficulty_multiplier[0] = 3
            @difficulty_multiplier[1] = 6
            while i < @enemyarray.length
                @enemyarray[i][7] = 100 * @difficulty_multiplier[0] #HP
                @shooting_speed = 1 * @difficulty_multiplier[1] #Shooting speed
                i += 1
            end
            i = 0
            @gamemode = 0
        elsif @gamemode == 3 #Doom
            i = 0
            @difficulty_multiplier[0] = 8
            @difficulty_multiplier[1] = 30
            while i < @enemyarray.length
                @enemyarray[i][7] = 100 * @difficulty_multiplier[0] #HP
                @shooting_speed = 1 * @difficulty_multiplier[1] #Shooting speed
                i += 1
            end
            i = 0
            @gamemode = 0
        end

        #Hit Collison Environment A.K.A HCE ---------------------------

        if @right == 1 
            if @on_r == 0
                @player_hitbox.x = @player_hitbox.x + 8
                @on_r = 1
            end
        elsif @left == 1
            if @on_l == 0
                @player_hitbox.x = @player_hitbox.x - 8
                @on_l = 1
            end
        end
        
        if @up == 1
            if @on_u == 0
                @player_hitbox.y = @player_hitbox.y - 8
                @on_u = 1
            end
        elsif @down == 1
            if @on_d == 0
                @player_hitbox.y = @player_hitbox.y + 8
                @on_d = 1
            end
        end

        if @right == 0 && @on_r == 1
            @player_hitbox.x = @player_hitbox.x - 8
            @on_r = 0
        elsif @left == 0 && @on_l == 1
            @player_hitbox.x = @player_hitbox.x + 8
            @on_l = 0
        end
        
        if @up == 0 && @on_u == 1
            @player_hitbox.y = @player_hitbox.y + 8
            @on_u = 0
        elsif @down == 0 && @on_d == 1
            @player_hitbox.y = @player_hitbox.y - 8
            @on_d = 0
        end

        hitbox_update_characters = 0
        hitbox_update_collision_boxes = 0
        while hitbox_update_characters < @characters_array.length
            while hitbox_update_collision_boxes < @wall_array.length - 1
                if collision(@characters_array[hitbox_update_characters], @wall_array[hitbox_update_collision_boxes][0]) == true
                    @correction_x = collision_dir_x(@characters_array[hitbox_update_characters], @wall_array[hitbox_update_collision_boxes][0], @x_dir, @y_dir)
                    @correction_y = collision_dir_y(@characters_array[hitbox_update_characters], @wall_array[hitbox_update_collision_boxes][0], @y_dir, @x_dir)
                    if @correction_x != 0
                        if @x_dir > 0
                            @player_hitbox.x = @player.x
                            @map.x = @map.x - (8 - @correction_x)
                            @x_dir = 0 
                            @y_dir = @y_dir * 1.428
                            j = 0
                        elsif @x_dir < 0
                            @player_hitbox.x = @player.x
                            @map.x = @map.x + (8 - @correction_x)
                            @x_dir = 0
                            @y_dir = @y_dir * 1.428
                            j = 0
                        end
                    end
                    if @correction_y != 0
                        if @y_dir > 0
                            @player_hitbox.y = @player.y
                            @map.y = @map.y - (8 - @correction_y) 
                            @y_dir = 0
                            @x_dir = @x_dir * 1.428
                            j = 0
                        elsif @y_dir < 0
                            @player_hitbox.y = @player.y
                            @map.y = @map.y + (8 - @correction_y) 
                            @y_dir = 0
                            @x_dir = @x_dir * 1.428
                            j = 0
                        end
                    end
                end
                hitbox_update_collision_boxes += 1
            end
            hitbox_update_collision_boxes = 0
            hitbox_update_characters += 1
        end

        j += 1
        while j > 20
            if @x_dir == 0 && @y_dir == 0 && @right == 0 && @left == 0 && @up == 0 && @down == 0

                @player_hitbox.x = @player.x
                @player_hitbox.y = @player.y

            end
            j = 0
        end


        # Player movement --------------------------------------------------

        @map.x -= @x_dir * @walk_speed # Flyttar map spriten istället för kamera då Ruby2D saknar kamera funktionalitet.
        @map.y -= @y_dir * @walk_speed # Finns ingen kamera variabel som kan anropas 
        


        # Enemy AI -------------------------------------------------------

        i = 0
        while i < @enemyarray.length # Referera till setup_var.rb Används för att effektivt kunna anropa alla/specifik enemy sprite. mha while-loop
            if @enemyarray[i][2] == 0
                @enemyarray[i][3] = -180 * @pixel_scaler
                @enemyarray[i][4] = -145 * @pixel_scaler
            elsif @enemyarray[i][2] == 1
                if @enemyarray[i][1] == 0 
                    @enemyarray[i][3] = 180 * @pixel_scaler
                    @enemyarray[i][4] = 145 * @pixel_scaler
                    @enemyarray[i][5] = 1
                elsif @enemyarray[i][1] <= 100
                    @enemyarray[i][8] = 3 * @enemyarray[i][5]
                    @enemyarray[i][3] -= 1 * @pixel_scaler * @enemyarray[i][5]
                elsif @enemyarray[i][1] <= 255
                    @enemyarray[i][8] = 4 * @enemyarray[i][5]
                    @enemyarray[i][4] += 1 * @pixel_scaler * @enemyarray[i][5]
                elsif @enemyarray[i][1] <= 335
                    @enemyarray[i][8] = 1 * @enemyarray[i][5]
                    @enemyarray[i][3] += 1 * @pixel_scaler * @enemyarray[i][5]
                elsif @enemyarray[i][1] == 336
                    @enemyarray[i][5] = -1
                end
            elsif @enemyarray[i][2] == 2
                if @enemyarray[i][1] == 0
                    @enemyarray[i][3] = 305 * @pixel_scaler
                    @enemyarray[i][4] = 70 * @pixel_scaler
                    @enemyarray[i][5] = 1
                elsif @enemyarray[i][1] <= 155
                    @enemyarray[i][8] = 4 * @enemyarray[i][5]
                    @enemyarray[i][4] += 1 * @pixel_scaler * @enemyarray[i][5]
                elsif @enemyarray[i][1] <= 315
                    @enemyarray[i][8] = 3 * @enemyarray[i][5]
                    @enemyarray[i][3] -= 1 * @pixel_scaler * @enemyarray[i][5]
                elsif @enemyarray[i][1] == 316
                    @enemyarray[i][5] = -1
                end
            elsif @enemyarray[i][2] == 3
                if @enemyarray[i][1] == 0
                    @enemyarray[i][3] = 410 * @pixel_scaler
                    @enemyarray[i][4] = 135 * @pixel_scaler
                    @enemyarray[i][5] = 1
                elsif @enemyarray[i][1] <= 275
                    @enemyarray[i][8] = 4 * @enemyarray[i][5]
                    @enemyarray[i][4] += 1 * @pixel_scaler * @enemyarray[i][5]
                elsif @enemyarray[i][1] <= 410
                    @enemyarray[i][8] = 3 * @enemyarray[i][5]
                    @enemyarray[i][3] -= 1 * @pixel_scaler * @enemyarray[i][5]
                elsif @enemyarray[i][1] <= 530
                    @enemyarray[i][8] = 4 * @enemyarray[i][5]
                    @enemyarray[i][4] += 1 * @pixel_scaler * @enemyarray[i][5]
                elsif @enemyarray[i][1] == 531
                    @enemyarray[i][5] = -1
                end
            elsif @enemyarray[i][2] == 4
                if @enemyarray[i][1] == 0
                    @enemyarray[i][3] = 35 * @pixel_scaler
                    @enemyarray[i][4] = 360 * @pixel_scaler
                    @enemyarray[i][5] = 1
                elsif @enemyarray[i][1] <= 165
                    @enemyarray[i][8] = 4 * @enemyarray[i][5]
                    @enemyarray[i][4] += 1 * @pixel_scaler * @enemyarray[i][5]
                elsif @enemyarray[i][1] <= 330
                    @enemyarray[i][8] = 1 * @enemyarray[i][5]
                    @enemyarray[i][3] += 1 * @pixel_scaler * @enemyarray[i][5]
                elsif @enemyarray[i][1] == 331
                    @enemyarray[i][5] = -1
                end
            elsif @enemyarray[i][2] == 5
                if @enemyarray[i][1] == 0
                    @enemyarray[i][3] = 360 * @pixel_scaler
                    @enemyarray[i][4] = 170 * @pixel_scaler
                end
                @enemyarray[i][0].rotate += -1
                if @enemyarray[i][0].rotate <= -360
                    @enemyarray[i][0].rotate += 360
                end 
            end
            
            @enemyarray[i][1] += @enemyarray[i][5]

            enemy_rotate_angle = mouse_angle(@player.x + @player.width/2, @player.y + @player.height/2, [@enemyarray[i][0].x + @enemyarray[i][0].width/2, @enemyarray[i][0].y + @enemyarray[i][0].height/2])[0]
            enemy_unit_vector = mouse_angle(@player.x + @player.width/2, @player.y + @player.height/2, [@enemyarray[i][0].x + @enemyarray[i][0].width/2, @enemyarray[i][0].y + @enemyarray[i][0].height/2])[1]
            if (@enemyarray[i][0].x - @player.x).abs < 100*@pixel_scaler && (@enemyarray[i][0].y - @player.y).abs < 80*@pixel_scaler && ((@enemyarray[i][0].rotate - enemy_rotate_angle).abs < 90 || (@enemyarray[i][0].rotate - enemy_rotate_angle).abs > 270)
                @enemyarray[i][0].rotate = enemy_rotate_angle
                @enemyarray[i][6] += 1 * @shooting_speed
                if @enemyarray[i][6] >= 150
                    @enemy_bullet_array << [
                        Sprite.new('sprites\bullet.png', width: 2 * (@pixel_scaler-1), height: 1 * (@pixel_scaler-1), rotate: @enemyarray[i][0].rotate), 
                        enemy_unit_vector[0], 
                        enemy_unit_vector[1], 
                        @enemyarray[i][3]+@enemyarray[i][0].width/2, 
                        @enemyarray[i][4]+@enemyarray[i][0].height/2
                    ]
                    @enemyarray[i][6] = 0
                    @shoot_sfx.play
                end
            else
                if i != 4
                    turn_angle = (@enemyarray[i][8] - 1).abs * -90
                
                    if turn_angle == 0
                        turn_angle -= 360
                    elsif turn_angle < -360
                        turn_angle += 360
                    end

                    if @enemyarray[i][0].rotate >= 0
                        @enemyarray[i][0].rotate -= 360
                    elsif @enemyarray[i][0].rotate < -360
                        @enemyarray[i][0].rotate += 360
                    end

                    if @enemyarray[i][0].rotate%10 != 0
                        @enemyarray[i][0].rotate -= @enemyarray[i][0].rotate%10
                    end

                    if @enemyarray[i][0].rotate != turn_angle
                        if @enemyarray[i][0].rotate < turn_angle && turn_angle - @enemyarray[i][0].rotate < (@enemyarray[i][0].rotate+360) - turn_angle || @enemyarray[i][0].rotate > turn_angle && turn_angle - (@enemyarray[i][0].rotate-360) < @enemyarray[i][0].rotate - turn_angle
                            @enemyarray[i][0].rotate += 10
                        else 
                            @enemyarray[i][0].rotate -= 10
                        end
                    end

                end
            end
            i += 1
        end
        
        i = 0
        while i < @enemyarray.length
            xy_array = xy_translate(@enemyarray[i][3], @enemyarray[i][4], @map)
            @enemyarray[i][0].x = xy_array[0]
            @enemyarray[i][0].y = xy_array[1]
            @enemyarray[i][0].add
            i += 1
        end

        # Enemy projectiles / hit reg -----------------------------

        i = 0
        while i < @enemy_bullet_array.length
            @enemy_bullet_array[i][3] += @enemy_bullet_array[i][1] * @bullet_speed
            @enemy_bullet_array[i][4] += @enemy_bullet_array[i][2] * @bullet_speed
            xy_array = xy_translate(@enemy_bullet_array[i][3], @enemy_bullet_array[i][4], @map)
            @enemy_bullet_array[i][0].x = xy_array[0]
            @enemy_bullet_array[i][0].y = xy_array[1]
            if @enemy_bullet_array[i][0].x > Window.width || @enemy_bullet_array[i][0].x < 0 || @enemy_bullet_array[i][0].y > Window.height || @enemy_bullet_array[i][0].y < 0
                @enemy_bullet_array[i][0].remove
                @enemy_bullet_array.delete_at(i)
            elsif collision(@player, @enemy_bullet_array[i][0]) == true && @damaged != true
                @health_index += 2
                @enemy_bullet_array[i][0].remove
                @enemy_bullet_array.delete_at(i)
                @damaged = true
            else
                j = 0
                while j < @wall_array.length - 1
                    if collision(@wall_array[j][0], @enemy_bullet_array[i][0]) == true
                        @enemy_bullet_array[i][0].remove
                        @enemy_bullet_array.delete_at(i)
                        j = @wall_array.length - 1
                    end
                    j += 1
                end
                if j != @wall_array.length
                    i += 1
                end
            end
        end

        # Player projectiles --------------------- 

        i = 0
        while i < @bullet_array.length
            if @bullet_array[i][1] == true
                @bullet_array[i][4] += @bullet_array[i][2] * @bullet_speed
                @bullet_array[i][5] += @bullet_array[i][3] * @bullet_speed
                xy_array = xy_translate(@bullet_array[i][4], @bullet_array[i][5], @map)
                @bullet_array[i][0].x = xy_array[0]
                @bullet_array[i][0].y = xy_array[1]
                @bullet_array[i][0].add
                if @bullet_array[i][0].x > Window.width || @bullet_array[i][0].x < 0 || @bullet_array[i][0].y > Window.height || @bullet_array[i][0].y < 0
                    @bullet_array[i][1] = false
                    @bullet_array[i][0].remove
                else 
                    j = 0
                    while j < @enemyarray.length
                        if collision(@enemyarray[j][0], @bullet_array[i][0]) == true
                            @bullet_array[i][1] = false
                            @bullet_array[i][0].remove
                            @enemyarray[j][7] -= 50
                            if @enemyarray[j][7] == 0
                                @enemy_death_array << [ #Skapar nya sprites istället för att använda redan definierade sprites.
                                    Sprite.new('sprites\enemy_death.png', clip_width: 25, width: 25 * (@pixel_scaler-1), height: 25 * (@pixel_scaler-1), x: 0, y: 0, loop: false, time: 100, rotate: @enemyarray[j][0].rotate),
                                    @enemyarray[j][3],
                                    @enemyarray[j][4],
                                    0
                                ]
                                @enemyarray[j][1] = 0
                                @enemyarray[j][2] = 0
                                @enemyarray[j][5] = 1
                                @enemyarray[j][0].remove
                            else
                                @enemyarray[j][0].remove
                            end
                        end
                        j += 1
                    end
                    
                    j = 0
                    while j < @wall_array.length - 1
                        if collision(@wall_array[j][0], @bullet_array[i][0]) == true
                            @bullet_array[i][1] = false
                            @bullet_array[i][0].remove
                            j = @wall_array.length - 1
                        end
                        j += 1
                    end
                end
            end
            i += 1
        end

        # Enemy death animation -------------------------

        i = 0
        while i < @enemy_death_array.length
            xy_array = xy_translate(@enemy_death_array[i][1], @enemy_death_array[i][2], @map)
            @enemy_death_array[i][0].x = xy_array[0]
            @enemy_death_array[i][0].y = xy_array[1]
            
            if @enemy_death_array[i][3] > 40 && @enemy_death_array[i][3]%1 == 0
                if @enemy_death_array[i][3]%2 == 0
                    @enemy_death_array[i][0].add
                else
                    @enemy_death_array[i][0].remove
                end
            end
            if @enemy_death_array[i][3] < 50
                @enemy_death_array[i][0].play
                @enemy_death_array[i][3] += 1
            else
                @enemy_death_array[i][0].remove
            end

            i += 1
        end

        # XY relative / wall placement -----------------------------------

        i = 0
        while i < @wall_array.length
            xy_array = xy_translate(@wall_array[i][1], @wall_array[i][2], @map)
            @wall_array[i][0].x = xy_array[0]
            @wall_array[i][0].y = xy_array[1]
            i += 1
        end

        # Player damage animation + healthbar animation -------------------------------------

        if @damaged
            if @damaged_timer%1 == 0
                if @damaged_timer%2 == 0
                    @player.add
                else 
                    @player.remove
                end
            end
            if @damaged_timer > 40
                @damaged_timer = 0
                @damaged = false
                @player.add
            end
            @damaged_timer += 1
        end
        
        @health_bar.play animation: :"#{@health_bar_array[@health_index]}"

        # gamestate ---------------------------------------------

        i = 0
        @gamestate = 3
        while i < @enemyarray.length     
            if @enemyarray[i][7] != 0
                @gamestate = 1
            end
            i += 1
        end

        if @health_index == 10
            @gamestate = 2
        end

        
        
        #debugging kod -----------------------------------------------------------------------------------------------------------------------
        # @text.remove
        # @text = Text.new(
        #     "#{(get :fps).to_i} #{rotate_angle.to_i} #{@ammo_mag_ak}/#{@ammo_total_ak} #{@ammo_mag_pistol}/#{@ammo_total_pistol} ",
        #     x: 20, y: 20,
        #     style: 'bold',
        #     size: 40,
        #     color: 'blue',
        # )

        # Ammo HUD -------------------------------------------------------------------

        @text_ammo_mag_pistol.remove
        if @gun_selected == 1
            @text_ammo_mag_pistol = Text.new(
                "#{@ammo_mag_pistol}",
                x: 269 * @pixel_scaler, y: 161 * @pixel_scaler,
                font: 'misc/PressStart2P-Regular.ttf',
                style: 'bold',
                size: 34,
                color: 'black',
            )
        end

        @text_ammo_total_pistol.remove
        if @gun_selected == 1
        @text_ammo_total_pistol = Text.new(
            "#{@ammo_total_pistol}",
            x: 284 * @pixel_scaler, y: 169 * @pixel_scaler,
            font: 'misc/PressStart2P-Regular.ttf',
            style: 'bold',
            size: 34,
            color: 'black',
        )
        end

        @text_ammo_mag_ak.remove
        if @gun_selected == 2
            @text_ammo_mag_ak = Text.new(
                "#{@ammo_mag_ak}",
                x: 269 * @pixel_scaler, y: 161 * @pixel_scaler,
                font: 'misc/PressStart2P-Regular.ttf',
                style: 'bold',
                size: 34,
                color: 'black',
            )
        end

        @text_ammo_total_ak.remove
        if @gun_selected == 2 && @ammo_total_ak < 100
            @text_ammo_total_ak = Text.new(
                "#{@ammo_total_ak}",
                x: 284 * @pixel_scaler, y: 169 * @pixel_scaler,
                font: 'misc/PressStart2P-Regular.ttf',
                style: 'bold',
                size: 34,
                color: 'black',
            )
        elsif @gun_selected == 2 && @ammo_total_ak >= 100
        @text_ammo_total_ak = Text.new(
            "#{@ammo_total_ak}",
            x: 282 * @pixel_scaler, y: 170 * @pixel_scaler,
            font: 'misc/PressStart2P-Regular.ttf',
            style: 'bold',
            size: 26,
            color: 'black',
        )
        end

        if @gun_selected == 1
            @pistol_siluette.add
            @ak_siluette.remove
        elsif @gun_selected == 2
            @pistol_siluette.remove
            @ak_siluette.add
        end


        # WIN and LOSE ------------------------------------------

    elsif @gamestate == 2
        @fadeout.add
        @fadeout.z = 999
        @player.z = @fadeout.z + 1
        if @death_timer == 0
            @player.play animation: :death
        elsif @death_timer >= 10
            @player.play animation: :linger, loop: true
        end
        if @death_timer == 30
            @gameover_text.add
            @gameover_text.z = @fadeout.z + 1
        end
        @death_timer += 1 

    elsif @gamestate == 3
        @fadeout.add
        @fadeout.z = 999
        @player.z = @fadeout.z + 1
        if @death_timer == 60
            @win_text.add
            @win_text.z = @fadeout.z + 1
        end
        @death_timer += 1 
    
    end
    
    
end

show

