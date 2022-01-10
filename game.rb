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
            if @on_l == 2
                p "sätter på left"
                @on_l = 0 
            end
        when 'a'
            @left = 1
            if @on_r == 2
                @on_r = 0
            end
        when 'w'
            @up = 1
            if @on_d == 2
                @on_d = 0
            end
        when 's'
            @down = 1
            if @on_u == 2
                @on_u = 0
            end
        when 'r'
            if @ammo_total >= 30
                @reload = 1
            end
        # when 'q'
        #     @player_hitbox.x = @player_hitbox.x - 8
        # when 'e'
        #     @player_hitbox.x = @player_hitbox.x + 8
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
    hitbox_update_shots = 0
    hitbox_update_entities = 0
    while hitbox_update_shots < @bullet_hitbox_array.length
        while hitbox_update_entities < @enemy_array.length
            if collision(@bullet_hitbox_array[hitbox_update_shots], @enemy_array[hitbox_update_entities][0])
                @enemy_array[hitbox_update_entities][1] += 1
                # @bullet_array[hitbox_update_shots][4] = -1000
                # @bullet_array[hitbox_update_shots][5] = -1000
                # @bullet_hitbox_array[hitbox_update_shots].x = @bullet_array[hitbox_update_shots][0].x
                # @bullet_hitbox_array[hitbox_update_shots].y = @bullet_array[hitbox_update_shots][0].y
            end
            hitbox_update_entities += 1
        end
        hitbox_update_entities = 0
        hitbox_update_shots += 1
    end

    xy_array = xy_translate(@enemy_1_x, @enemy_1_y, @map)
    @enemy_1.x = xy_array[0]
    @enemy_1.y = xy_array[1]

    #Testar bara min hitbox grej så gjorde en relativ (kommenterar bort om du vill)
    
    xz_array = xy_translate(@map_hitbox_test_x, @map_hitbox_test_y, @map)
    @map_hitbox_test.x = xy_array[0]
    @map_hitbox_test.y = xy_array[1]

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
    elsif @up == 1
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
    elsif @up == 0 && @on_u == 1
        @player_hitbox.y = @player_hitbox.y + 8
        @on_u = 0
    elsif @down == 0 && @on_d == 1
        @player_hitbox.y = @player_hitbox.y - 8
        @on_d = 0
    end

    # hitbox_update_characters = 0
    # hitbox_update_collision_boxes = 0
    # while hitbox_update_characters < @characters_array.length
    #     while hitbox_update_collision_boxes < @hitbox_array.length
    #         if collision(@characters_array[hitbox_update_characters], @hitbox_array[hitbox_update_collision_boxes]) == true
    #             @correction_x = collision_dir_x(@characters_array[hitbox_update_characters], @hitbox_array[hitbox_update_collision_boxes], @x_dir)
    #             if @correction_x != false
    #                 if @x_dir > 0
    #                     @map.x = @map.x + @correction_x 
    #                     @on_r = 2
    #                 elsif @x_dir < 0
    #                     @map.x = @map.x - @correction_x 
    #                     @on_l = 2
    #                 end
    #             end
    #             @correction_y = collision_dir_y(@characters_array[hitbox_update_characters], @hitbox_array[hitbox_update_collision_boxes], @y_dir)
    #             if @correction_y != false
    #                 if @y_dir > 0
    #                     @map.y = @map.y - @correction_y 
    #                     @on_d = 2
    #                 elsif @y_dir < 0
    #                     @map.y = @map.y + @correction_y 
    #                     @on_u = 2
    #                 end
    #             end
    #         end
    #         hitbox_update_collision_boxes += 1
    #     end
    #     hitbox_update_collision_boxes = 0
    #     hitbox_update_characters += 1
    # end

    hitbox_update_characters = 0
    hitbox_update_collision_boxes = 0
    while hitbox_update_characters < @characters_array.length
        while hitbox_update_collision_boxes < @wall_array.length
            if collision(@characters_array[hitbox_update_characters], @wall_array[hitbox_update_collision_boxes][0]) == true
                p @correction_x = collision_dir_x(@characters_array[hitbox_update_characters], @wall_array[hitbox_update_collision_boxes][0], @x_dir)
                if @correction_x != false
                    p "Inne i x"
                    if @x_dir > 0
                        @player_hitbox.x = @player.x
                        @map.x = @map.x - (8 - @correction_x) #BEHÄVER FIXA 0 VID FALSE SKALL BLI NOLL TYP
                        @on_r = 2
                    elsif @x_dir < 0
                        @player_hitbox.x = @player.x
                        @map.x = @map.x + (8 - @correction_x)
                        @on_l = 2
                    end
                end
                p @correction_y = collision_dir_y(@characters_array[hitbox_update_characters], @wall_array[hitbox_update_collision_boxes][0], @y_dir)
                if @correction_y != false
                    p "Inne i y"
                    if @y_dir > 0
                        @player_hitbox.y = @player.y
                        @map.y = @map.y - (8 - @correction_y) 
                        @on_d = 2
                    elsif @y_dir < 0
                        @player_hitbox.y = @player.y
                        @map.y = @map.y + (8 - @correction_y) 
                        @on_u = 2
                    end
                end
            end
            hitbox_update_collision_boxes += 1
        end
        hitbox_update_collision_boxes = 0
        hitbox_update_characters += 1
    end

    #Fixa bugg med upp och ner samt kanter

    @player.rotate = rotate_angle

    # x_dir postivt = höger, negativt = vänster
    # y_dir postivt = ner, negativt = upp

    if @x_dir > 0 && @on_r == 2
        @x_dir = 0
        # p "sätter till noll h"
    elsif @x_dir < 0 && @on_l == 2
        @x_dir = 0
        # p "sätter till noll v"
    elsif @y_dir > 0 && @on_d == 2
        # p "sätter till noll n"
        @y_dir = 0
    elsif @y_dir < 0 && @on_u == 2
        # p "sätter till noll u"
        @y_dir = 0
    end
    
    @map.x -= @x_dir * @walk_speed
    @map.y -= @y_dir * @walk_speed

    
    # if @x_dir == 0 && @y_dir == 0
    #     @player_hitbox.x = @player.x
    #     @player_hitbox.y = @player.y
    # end




    i = 0
    while i < @bullet_array.length
        @bullet_array[i][4] += @bullet_array[i][2] * @bullet_speed
        @bullet_array[i][5] += @bullet_array[i][3] * @bullet_speed
        xy_array = xy_translate(@bullet_array[i][4], @bullet_array[i][5], @map)
        @bullet_array[i][0].x = xy_array[0]
        @bullet_array[i][0].y = xy_array[1]
        @bullet_array[i][0].add
        if @bullet_array[i][0].x > Window.width || @bullet_array[i][0].x < 0 || @bullet_array[i][0].y > Window.height || @bullet_array[i][0].y < 0
            if @bullet_array[i][1] == true && @health_index < 11 #SKULLE BARA TESTA IFALL KODEN FUNKAR, TAR BORT DETTA SEN
                @health_index += 1
            end
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


    # if collision(@submap_col, @player) == true
    #     if @submap.opacity > 0
    #         @submap.opacity -= 0.1
    #     end
    # else
    #     if @submap.opacity < 1
    #         @submap.opacity += 0.1
    #     end
    # end
   
    @health_bar.play animation: :"#{@health_bar_array[@health_index]}"

    #Här är debugging kod -----------------------------------------------------------------------------------------------------------------------
    @text.remove
    @text = Text.new(
        "#{(get :fps).to_i} #{rotate_angle.to_i} #{@ammo_mag}/#{@ammo_total} #{@enemy_array[0][1]} #{@hit_collision_test}",
        x: 20, y: 20,
        style: 'bold',
        size: 40,
        color: 'blue',
    )
end

show

