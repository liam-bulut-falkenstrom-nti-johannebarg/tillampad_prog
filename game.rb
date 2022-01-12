# Hej klassen! Välkommen till spelet!
require 'ruby2d'
require_relative "setup_var.rb"
require_relative "help_functions.rb"

set width: 300 * @pixel_scaler
set height: 180 * @pixel_scaler
set resizable: true

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
            if @ammo_total >= 30
                @reload = 1
            end
        when 'q'
            @player_hitbox.x = @player_hitbox.x - 1
        when 'e'
            @player_hitbox.x = @player_hitbox.x + 1
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
    if @ammo_mag > 0
        @shooting = true
    end
    when :middle

    when :right

    end
end

i = 0
j = 0
update do
    mousex = get :mouse_x
    mousey = get :mouse_y
    player_center_array = [(@player.x + @player.width/2), (@player.y + @player.height/2)] # Kan komma att ändras i och med att mittpunkten för sprites skiljer sig. 
    rotate_angle = mouse_angle(mousex, mousey, player_center_array)[0]
    unit_vector = mouse_angle(mousex, mousey, player_center_array)[1]

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
                @ammo_mag -= 1
                i = @bullet_array.length
                @player.play animations: :shoot

                # @bullet_hitbox_array[i].x = @bullet_array[i][0].x
                # @bullet_hitbox_array[i].y = @bullet_array[i][0].y
                # @bullet_hitbox_array[i].rotate = @bullet_array[i][0].rotate

            end
            i += 1
        end
        @shooting = false
    end

    if @reload == 1
        @reload_time += 1
        if @reload_time >= 60
            @ammo_mag = 30
            @ammo_total -= 30
            @reload = 0
            @reload_time = 0
        end
    end



    #Hit detection player_enemy
    # hitbox_update_shots = 0
    # hitbox_update_entities = 0
    # while hitbox_update_shots < @bullet_hitbox_array.length
    #     while hitbox_update_entities < @enemy_array.length
    #         if collision(@bullet_hitbox_array[hitbox_update_shots], @enemy_array[hitbox_update_entities][0])
    #             @enemy_array[hitbox_update_entities][1] += 1
    #             # @bullet_array[hitbox_update_shots][4] = -1000
    #             # @bullet_array[hitbox_update_shots][5] = -1000
    #             # @bullet_hitbox_array[hitbox_update_shots].x = @bullet_array[hitbox_update_shots][0].x
    #             # @bullet_hitbox_array[hitbox_update_shots].y = @bullet_array[hitbox_update_shots][0].y
    #         end
    #         hitbox_update_entities += 1
    #     end
    #     hitbox_update_entities = 0
    #     hitbox_update_shots += 1
    # end

    #Testar bara min hitbox grej så gjorde en relativ (kommenterar bort om du vill)
    
    # xz_array = xy_translate(@map_hitbox_test_x, @map_hitbox_test_y, @map)
    # @map_hitbox_test.x = xy_array[0]
    # @map_hitbox_test.y = xy_array[1]

    #Hit collison Enviorment

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
                p @correction_x = collision_dir_x(@characters_array[hitbox_update_characters], @wall_array[hitbox_update_collision_boxes][0], @x_dir, @y_dir)
                p @correction_y = collision_dir_y(@characters_array[hitbox_update_characters], @wall_array[hitbox_update_collision_boxes][0], @y_dir, @x_dir)
                if @correction_x != false
                    p "Inne i x" 
                    if @x_dir > 0
                        @player_hitbox.x = @player.x
                        @map.x = @map.x - (8 - @correction_x)
                        @x_dir = 0 
                    elsif @x_dir < 0
                        @player_hitbox.x = @player.x
                        @map.x = @map.x + (8 - @correction_x)
                        @x_dir = 0
                    end
                end
                if @correction_y != false #Reminder testa att byta mot noll
                    p "Inne i y"
                    if @y_dir > 0
                        @player_hitbox.y = @player.y
                        @map.y = @map.y - (8 - @correction_y) 
                        @y_dir = 0
                    elsif @y_dir < 0
                        @player_hitbox.y = @player.y
                        @map.y = @map.y + (8 - @correction_y) 
                        @y_dir = 0
                    end
                end
            end
            hitbox_update_collision_boxes += 1
        end
        hitbox_update_collision_boxes = 0
        hitbox_update_characters += 1
    end


    @player.rotate = rotate_angle

    # x_dir postivt = höger, negativt = vänster
    # y_dir postivt = ner, negativt = upp
    
    @map.x -= @x_dir * @walk_speed
    @map.y -= @y_dir * @walk_speed

    j += 1
    while j > 120 
        if @x_dir == 0 && @y_dir == 0 && @right == 0 && @left == 0 && @up == 0 && @down == 0
            @player_hitbox.x = @player.x
            @player_hitbox.y = @player.y
        end
        j = 0
    end
    i = 0
    while i < @enemyarray.length
        if @enemyarray[i][2] == 1
            if @enemyarray[i][1] == 0
                @enemyarray[i][3] = 180 * @pixel_scaler
                @enemyarray[i][4] = 145 * @pixel_scaler
                @enemyarray[i][5] = 1
                @enemyarray[i][0].rotate = 0 
            elsif @enemyarray[i][1] <= 100
                if (@enemyarray[i][5] == 1 && @enemyarray[i][0].rotate != -180) || (@enemyarray[i][5] == -1 && @enemyarray[i][0].rotate != 0)
                    @enemyarray[i][0].rotate -= 5 * @enemyarray[i][5]
                    if @enemyarray[i][0].rotate%5 != 0
                        if @enemyarray[i][0].rotate < 0
                            @enemyarray[i][0].rotate += (@enemyarray[i][0].rotate%5).abs
                        else
                            @enemyarray[i][0].rotate -= (@enemyarray[i][0].rotate%5).abs
                        end
                    end
                    @enemyarray[i][0].rotate = @enemyarray[i][0].rotate.to_i
                    if @enemyarray[i][0].rotate <= -360
                        @enemyarray[i][0].rotate += 360
                    elsif @enemyarray[i][0].rotate >= 360
                        @enemyarray[i][0].rotate -= 360
                    end
                end
                @enemyarray[i][3] -= 1 * @pixel_scaler * @enemyarray[i][5]
            elsif @enemyarray[i][1] <= 255
                if (@enemyarray[i][5] == 1 && @enemyarray[i][0].rotate != -270) || (@enemyarray[i][5] == -1 && @enemyarray[i][0].rotate != 270)
                    @enemyarray[i][0].rotate -= 5 * @enemyarray[i][5]
                    if @enemyarray[i][0].rotate%5 != 0
                        if @enemyarray[i][0].rotate < 0
                            @enemyarray[i][0].rotate += (@enemyarray[i][0].rotate%5).abs
                        else
                            @enemyarray[i][0].rotate -= (@enemyarray[i][0].rotate%5).abs
                        end
                    end 
                    @enemyarray[i][0].rotate = @enemyarray[i][0].rotate.to_i
                    if @enemyarray[i][0].rotate <= -360
                        @enemyarray[i][0].rotate += 360
                    elsif @enemyarray[i][0].rotate >= 360
                        @enemyarray[i][0].rotate -= 360
                    end
                end
                @enemyarray[i][4] += 1 * @pixel_scaler * @enemyarray[i][5]
            elsif @enemyarray[i][1] <= 335
                if (@enemyarray[i][5] == 1 && @enemyarray[i][0].rotate != 0.0) || (@enemyarray[i][5] == -1 && @enemyarray[i][0].rotate != 180)
                    @enemyarray[i][0].rotate -= 5 * @enemyarray[i][5]
                    if @enemyarray[i][0].rotate%5 != 0
                        if @enemyarray[i][0].rotate < 0
                            @enemyarray[i][0].rotate += (@enemyarray[i][0].rotate%5).abs
                        else
                            @enemyarray[i][0].rotate -= (@enemyarray[i][0].rotate%5).abs
                        end
                    end 
                    @enemyarray[i][0].rotate = @enemyarray[i][0].rotate.to_i
                    if @enemyarray[i][0].rotate <= -360
                        @enemyarray[i][0].rotate += 360
                    elsif @enemyarray[i][0].rotate >= 360
                        @enemyarray[i][0].rotate -= 360
                    end
                end
                @enemyarray[i][3] += 1 * @pixel_scaler * @enemyarray[i][5]
            elsif @enemyarray[i][1] == 336
                @enemyarray[i][5] = -1
            end
            @enemyarray[i][1] += @enemyarray[i][5]
            if (@enemyarray[i][0].x - @player.x).abs < 100*@pixel_scaler && (@enemyarray[i][0].y - @player.y).abs < 80*@pixel_scaler
                enemy_rotate_angle = mouse_angle(@player.x + @player.width/2, @player.y + @player.height/2, [@enemyarray[i][0].x + @enemyarray[i][0].width/2, @enemyarray[i][0].y + @enemyarray[i][0].height/2])[0]
                enemy_unit_vector = mouse_angle(@player.x + @player.width/2, @player.y + @player.height/2, [@enemyarray[i][0].x + @enemyarray[i][0].width/2, @enemyarray[i][0].y + @enemyarray[i][0].height/2])[1]
                if (@enemyarray[i][0].rotate - enemy_rotate_angle).abs < 90 || (@enemyarray[i][0].rotate - enemy_rotate_angle).abs > 270
                    @enemyarray[i][0].rotate = enemy_rotate_angle
                    @enemyarray[i][6] += 1
                    if @enemyarray[i][6] == 150
                        @enemy_bullet_array << [
                            Sprite.new('sprites\bullet.png', width: 2 * (@pixel_scaler-1), height: 1 * (@pixel_scaler-1), rotate: @enemyarray[i][0].rotate), 
                            enemy_unit_vector[0], 
                            enemy_unit_vector[1], 
                            @enemyarray[i][3]+@enemyarray[i][0].width/2, 
                            @enemyarray[i][4]+@enemyarray[i][0].height/2
                        ]
                        @enemyarray[i][6] = 0
                    end
                end
            end
        elsif @enemyarray[i][2] == 2
            if @enemyarray[i][1] == 0
                @enemyarray[i][3] = 305 * @pixel_scaler
                @enemyarray[i][4] = 70 * @pixel_scaler
                @enemyarray[i][5] = 1
                @enemyarray[i][0].rotate = -90
            elsif @enemyarray[i][1] <= 155
                if (@enemyarray[i][5] == 1 && @enemyarray[i][0].rotate != 90) || (@enemyarray[i][5] == -1 && @enemyarray[i][0].rotate != -90)
                    @enemyarray[i][0].rotate += 5 * @enemyarray[i][5]
                    if @enemyarray[i][0].rotate%5 != 0
                        if @enemyarray[i][0].rotate < 0
                            @enemyarray[i][0].rotate += (@enemyarray[i][0].rotate%5).abs
                        else
                            @enemyarray[i][0].rotate -= (@enemyarray[i][0].rotate%5).abs
                        end
                    end
                    @enemyarray[i][0].rotate = @enemyarray[i][0].rotate.to_i
                    if @enemyarray[i][0].rotate <= -360
                        @enemyarray[i][0].rotate += 360
                    elsif @enemyarray[i][0].rotate >= 360
                        @enemyarray[i][0].rotate -= 360
                    end
                end
                @enemyarray[i][4] += 1 * @pixel_scaler * @enemyarray[i][5]
            elsif @enemyarray[i][1] <= 315
                if (@enemyarray[i][5] == 1 && @enemyarray[i][0].rotate != 180) || (@enemyarray[i][5] == -1 && @enemyarray[i][0].rotate != 0)
                    @enemyarray[i][0].rotate += 5 * @enemyarray[i][5]
                    if @enemyarray[i][0].rotate%5 != 0
                        if @enemyarray[i][0].rotate < 0
                            @enemyarray[i][0].rotate += (@enemyarray[i][0].rotate%5).abs
                        else
                            @enemyarray[i][0].rotate -= (@enemyarray[i][0].rotate%5).abs
                        end
                    end
                    @enemyarray[i][0].rotate = @enemyarray[i][0].rotate.to_i
                    if @enemyarray[i][0].rotate <= -360
                        @enemyarray[i][0].rotate += 360
                    elsif @enemyarray[i][0].rotate >= 360
                        @enemyarray[i][0].rotate -= 360
                    end
                end
                @enemyarray[i][3] -= 1 * @pixel_scaler * @enemyarray[i][5]
            elsif @enemyarray[i][1] == 316
                @enemyarray[i][5] = -1
            end
            @enemyarray[i][1] += @enemyarray[i][5]
            if (@enemyarray[i][0].x - @player.x).abs < 100*@pixel_scaler && (@enemyarray[i][0].y - @player.y).abs < 80*@pixel_scaler
                enemy_rotate_angle = mouse_angle(@player.x + @player.width/2, @player.y + @player.height/2, [@enemyarray[i][0].x + @enemyarray[i][0].width/2, @enemyarray[i][0].y + @enemyarray[i][0].height/2])[0]
                enemy_unit_vector = mouse_angle(@player.x + @player.width/2, @player.y + @player.height/2, [@enemyarray[i][0].x + @enemyarray[i][0].width/2, @enemyarray[i][0].y + @enemyarray[i][0].height/2])[1]
                if (@enemyarray[i][0].rotate - enemy_rotate_angle).abs < 90 || (@enemyarray[i][0].rotate - enemy_rotate_angle).abs > 270
                    @enemyarray[i][0].rotate = enemy_rotate_angle
                    @enemyarray[i][6] += 1
                    if @enemyarray[i][6] == 150
                        @enemy_bullet_array << [
                            Sprite.new('sprites\bullet.png', width: 2 * (@pixel_scaler-1), height: 1 * (@pixel_scaler-1), rotate: @enemyarray[i][0].rotate), 
                            enemy_unit_vector[0], 
                            enemy_unit_vector[1], 
                            @enemyarray[i][3]+@enemyarray[i][0].width/2, 
                            @enemyarray[i][4]+@enemyarray[i][0].height/2
                        ]
                        @enemyarray[i][6] = 0
                    end
                end
            end
        elsif @enemyarray[i][2] == 3
            if @enemyarray[i][1] == 0
                @enemyarray[i][3] = 410 * @pixel_scaler
                @enemyarray[i][4] = 135 * @pixel_scaler
                @enemyarray[i][5] = 1
                @enemyarray[i][0].rotate = -90
            elsif @enemyarray[i][1] <= 275
                if (@enemyarray[i][5] == 1 && @enemyarray[i][0].rotate != -270) || (@enemyarray[i][5] == -1 && @enemyarray[i][0].rotate != -90)
                    @enemyarray[i][0].rotate -= 5 * @enemyarray[i][5].abs
                    if @enemyarray[i][0].rotate%5 != 0
                        if @enemyarray[i][0].rotate < 0
                            @enemyarray[i][0].rotate += (@enemyarray[i][0].rotate%5).abs
                        else
                            @enemyarray[i][0].rotate -= (@enemyarray[i][0].rotate%5).abs
                        end
                    end
                    @enemyarray[i][0].rotate = @enemyarray[i][0].rotate.to_i
                    if @enemyarray[i][0].rotate <= -360
                        @enemyarray[i][0].rotate += 360
                    elsif @enemyarray[i][0].rotate >= 360
                        @enemyarray[i][0].rotate -= 360
                    end
                end
                @enemyarray[i][4] += 1 * @pixel_scaler * @enemyarray[i][5]
            elsif @enemyarray[i][1] <= 410
                if (@enemyarray[i][5] == 1 && @enemyarray[i][0].rotate != -180) || (@enemyarray[i][5] == -1 && @enemyarray[i][0].rotate != 0)
                    @enemyarray[i][0].rotate += 5 * @enemyarray[i][5].abs
                    if @enemyarray[i][0].rotate%5 != 0
                        if @enemyarray[i][0].rotate < 0
                            @enemyarray[i][0].rotate += (@enemyarray[i][0].rotate%5).abs
                        else
                            @enemyarray[i][0].rotate -= (@enemyarray[i][0].rotate%5).abs
                        end
                    end
                    @enemyarray[i][0].rotate = @enemyarray[i][0].rotate.to_i
                    if @enemyarray[i][0].rotate <= -360
                        @enemyarray[i][0].rotate += 360
                    elsif @enemyarray[i][0].rotate >= 360
                        @enemyarray[i][0].rotate -= 360
                    end
                end
                @enemyarray[i][3] -= 1 * @pixel_scaler * @enemyarray[i][5]
            elsif @enemyarray[i][1] <= 530
                if (@enemyarray[i][5] == 1 && @enemyarray[i][0].rotate != -270) || (@enemyarray[i][5] == -1 && @enemyarray[i][0].rotate != -90)
                    @enemyarray[i][0].rotate -= 5 * @enemyarray[i][5]
                    if @enemyarray[i][0].rotate%5 != 0
                        if @enemyarray[i][0].rotate < 0
                            @enemyarray[i][0].rotate += (@enemyarray[i][0].rotate%5).abs
                        else
                            @enemyarray[i][0].rotate -= (@enemyarray[i][0].rotate%5).abs
                        end
                    end
                    @enemyarray[i][0].rotate = @enemyarray[i][0].rotate.to_i
                    if @enemyarray[i][0].rotate <= -360
                        @enemyarray[i][0].rotate += 360
                    elsif @enemyarray[i][0].rotate >= 360
                        @enemyarray[i][0].rotate -= 360
                    end
                end
                @enemyarray[i][4] += 1 * @pixel_scaler * @enemyarray[i][5]
            elsif @enemyarray[i][1] == 531
                @enemyarray[i][5] = -1
            end
            @enemyarray[i][1] += @enemyarray[i][5]
            if (@enemyarray[i][0].x - @player.x).abs < 100*@pixel_scaler && (@enemyarray[i][0].y - @player.y).abs < 80*@pixel_scaler
                enemy_rotate_angle = mouse_angle(@player.x + @player.width/2, @player.y + @player.height/2, [@enemyarray[i][0].x + @enemyarray[i][0].width/2, @enemyarray[i][0].y + @enemyarray[i][0].height/2])[0]
                enemy_unit_vector = mouse_angle(@player.x + @player.width/2, @player.y + @player.height/2, [@enemyarray[i][0].x + @enemyarray[i][0].width/2, @enemyarray[i][0].y + @enemyarray[i][0].height/2])[1]
                if (@enemyarray[i][0].rotate - enemy_rotate_angle).abs < 90 || (@enemyarray[i][0].rotate - enemy_rotate_angle).abs > 270
                    @enemyarray[i][0].rotate = enemy_rotate_angle
                    @enemyarray[i][6] += 1
                    if @enemyarray[i][6] == 150
                        @enemy_bullet_array << [
                            Sprite.new('sprites\bullet.png', width: 2 * (@pixel_scaler-1), height: 1 * (@pixel_scaler-1), rotate: @enemyarray[i][0].rotate), 
                            enemy_unit_vector[0], 
                            enemy_unit_vector[1], 
                            @enemyarray[i][3]+@enemyarray[i][0].width/2, 
                            @enemyarray[i][4]+@enemyarray[i][0].height/2
                        ]
                        @enemyarray[i][6] = 0
                    end
                end
            end
        elsif @enemyarray[i][2] == 4
            if @enemyarray[i][1] == 0
                @enemyarray[i][3] = 35 * @pixel_scaler
                @enemyarray[i][4] = 360 * @pixel_scaler
                @enemyarray[i][5] = 1
                @enemyarray[i][0].rotate = -90
            elsif @enemyarray[i][1] <= 165
                if (@enemyarray[i][5] == 1 && @enemyarray[i][0].rotate != -270) || (@enemyarray[i][5] == -1 && @enemyarray[i][0].rotate != -90)
                    @enemyarray[i][0].rotate -= 5 * @enemyarray[i][5]
                    if @enemyarray[i][0].rotate%5 != 0
                        if @enemyarray[i][0].rotate < 0
                            @enemyarray[i][0].rotate += (@enemyarray[i][0].rotate%5).abs
                        else
                            @enemyarray[i][0].rotate -= (@enemyarray[i][0].rotate%5).abs
                        end
                    end
                    @enemyarray[i][0].rotate = @enemyarray[i][0].rotate.to_i
                    if @enemyarray[i][0].rotate <= -360
                        @enemyarray[i][0].rotate += 360
                    elsif @enemyarray[i][0].rotate >= 360
                        @enemyarray[i][0].rotate -= 360
                    end
                end
                @enemyarray[i][4] += 1 * @pixel_scaler * @enemyarray[i][5]
            elsif @enemyarray[i][1] <= 330
                if (@enemyarray[i][5] == 1 && @enemyarray[i][0].rotate != 0) || (@enemyarray[i][5] == -1 && @enemyarray[i][0].rotate != -180)
                    @enemyarray[i][0].rotate -= 5 * @enemyarray[i][5].abs
                    if @enemyarray[i][0].rotate%5 != 0
                        if @enemyarray[i][0].rotate < 0
                            @enemyarray[i][0].rotate += (@enemyarray[i][0].rotate%5).abs
                        else
                            @enemyarray[i][0].rotate -= (@enemyarray[i][0].rotate%5).abs
                        end
                    end
                    @enemyarray[i][0].rotate = @enemyarray[i][0].rotate.to_i
                    if @enemyarray[i][0].rotate <= -360
                        @enemyarray[i][0].rotate += 360
                    elsif @enemyarray[i][0].rotate >= 360
                        @enemyarray[i][0].rotate -= 360
                    end
                end
                @enemyarray[i][3] += 1 * @pixel_scaler * @enemyarray[i][5]
            elsif @enemyarray[i][1] == 331
                @enemyarray[i][5] = -1
            end
            @enemyarray[i][1] += @enemyarray[i][5]
            if (@enemyarray[i][0].x - @player.x).abs < 100*@pixel_scaler && (@enemyarray[i][0].y - @player.y).abs < 80*@pixel_scaler
                enemy_rotate_angle = mouse_angle(@player.x + @player.width/2, @player.y + @player.height/2, [@enemyarray[i][0].x + @enemyarray[i][0].width/2, @enemyarray[i][0].y + @enemyarray[i][0].height/2])[0]
                enemy_unit_vector = mouse_angle(@player.x + @player.width/2, @player.y + @player.height/2, [@enemyarray[i][0].x + @enemyarray[i][0].width/2, @enemyarray[i][0].y + @enemyarray[i][0].height/2])[1]
                if (@enemyarray[i][0].rotate - enemy_rotate_angle).abs < 90 || (@enemyarray[i][0].rotate - enemy_rotate_angle).abs > 270
                    @enemyarray[i][0].rotate = enemy_rotate_angle
                    @enemyarray[i][6] += 1
                    if @enemyarray[i][6] == 150
                        @enemy_bullet_array << [
                            Sprite.new('sprites\bullet.png', width: 2 * (@pixel_scaler-1), height: 1 * (@pixel_scaler-1), rotate: @enemyarray[i][0].rotate), 
                            enemy_unit_vector[0], 
                            enemy_unit_vector[1], 
                            @enemyarray[i][3]+@enemyarray[i][0].width/2, 
                            @enemyarray[i][4]+@enemyarray[i][0].height/2
                        ]
                        @enemyarray[i][6] = 0
                    end
                end
            end
            p @enemyarray[i][0].rotate #SPINNAR FÖR ATT DE ALDRIG BLIR NEGATIVA VINKELVÄRDEN, ÄNDRA SÅ ATT DET KAN VARA BÅDE POSITIVT OCH NEGATIVT VÄRDE PÅ VINKELN
        elsif @enemyarray[i][2] == 5
            if @enemyarray[i][1] == 0
                @enemyarray[i][3] = 360 * @pixel_scaler
                @enemyarray[i][4] = 170 * @pixel_scaler
            end
            @enemyarray[i][0].rotate += -1
            if @enemyarray[i][0].rotate <= -360
                @enemyarray[i][0].rotate += 360
            end 
            if (@enemyarray[i][0].x - @player.x).abs < 100*@pixel_scaler && (@enemyarray[i][0].y - @player.y).abs < 80*@pixel_scaler
                enemy_rotate_angle = mouse_angle(@player.x + @player.width/2, @player.y + @player.height/2, [@enemyarray[i][0].x + @enemyarray[i][0].width/2, @enemyarray[i][0].y + @enemyarray[i][0].height/2])[0]
                enemy_unit_vector = mouse_angle(@player.x + @player.width/2, @player.y + @player.height/2, [@enemyarray[i][0].x + @enemyarray[i][0].width/2, @enemyarray[i][0].y + @enemyarray[i][0].height/2])[1]
                if (@enemyarray[i][0].rotate - enemy_rotate_angle).abs < 90 || (@enemyarray[i][0].rotate - enemy_rotate_angle).abs > 270
                    @enemyarray[i][0].rotate = enemy_rotate_angle
                    @enemyarray[i][6] += 1
                    if @enemyarray[i][6] == 150
                        @enemy_bullet_array << [
                            Sprite.new('sprites\bullet.png', width: 2 * (@pixel_scaler-1), height: 1 * (@pixel_scaler-1), rotate: @enemyarray[i][0].rotate), 
                            enemy_unit_vector[0], 
                            enemy_unit_vector[1], 
                            @enemyarray[i][3]+@enemyarray[i][0].width/2, 
                            @enemyarray[i][4]+@enemyarray[i][0].height/2
                        ]
                        @enemyarray[i][6] = 0
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
        i += 1
    end

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
        elsif collision(@player, @enemy_bullet_array[i][0]) == true
            @health_index += 1
            @enemy_bullet_array[i][0].remove
            @enemy_bullet_array.delete_at(i)
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

    i = 0
    while i < @bullet_array.length
        @bullet_array[i][4] += @bullet_array[i][2] * @bullet_speed
        @bullet_array[i][5] += @bullet_array[i][3] * @bullet_speed
        xy_array = xy_translate(@bullet_array[i][4], @bullet_array[i][5], @map)
        @bullet_array[i][0].x = xy_array[0]
        @bullet_array[i][0].y = xy_array[1]
        @bullet_array[i][0].add
        if @bullet_array[i][0].x > Window.width || @bullet_array[i][0].x < 0 || @bullet_array[i][0].y > Window.height || @bullet_array[i][0].y < 0
            @bullet_array[i][1] = false
            @bullet_array[i][0].remove
        end
        i += 1
    end

    i = 0
    while i < @wall_array.length
        xy_array = xy_translate(@wall_array[i][1], @wall_array[i][2], @map)
        @wall_array[i][0].x = xy_array[0]
        @wall_array[i][0].y = xy_array[1]
        i += 1
    end

    @submap.x = @map.x
    @submap.y = @map.y


    if collision(@submap_col, @player) == true
        if @submap.opacity > 0
            @submap.opacity -= 0.1
        end
    else
        if @submap.opacity < 1
            @submap.opacity += 0.1
        end
    end
   
    @health_bar.play animation: :"#{@health_bar_array[@health_index]}"

    #Här är debugging kod -----------------------------------------------------------------------------------------------------------------------
    @text.remove
    @text = Text.new(
        "#{(get :fps).to_i} #{rotate_angle.to_i} #{@ammo_mag}/#{@ammo_total} #{@hit_collision_test}",
        x: 20, y: 20,
        style: 'bold',
        size: 40,
        color: 'blue',
    )
end

show

