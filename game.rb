# Hej klassen! Välkommen till spelet!
require 'ruby2d'
require_relative "setup_var.rb"
require_relative "help_functions.rb"

set width: 200 * @pixel_scaler
set height: 120 * @pixel_scaler
set resizable: true

on :key_held do |event|
    case event.key
        when 'd'
            @x_dir = 1
            @right = 1
        when 'a'
            @x_dir = -1
            @left = 1
        when 'w'
            @y_dir = -1
            @up = 1
        when 's'
            @y_dir = 1
            @down = 1
        when 'r'
            if @ammo_total >= 30
                @reload = 1
            end
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
        i = 0
        while i < @bullet_array.length  
            if @bullet_array[i][1] == false
                mousex = get :mouse_x
                mousey = get :mouse_y
                player_center_array = [(@player.x + @player.width/2), (@player.y + @player.height/2)] # Kan komma att ändras i och med att mittpunkten/tyngdpunkten för sprites skiljer sig. 
                rotate_angle = mouse_angle(mousex, mousey, player_center_array)[0]
                unit_vector = mouse_angle(mousex, mousey, player_center_array)[1]
                @bullet_array[i][4] = @player.x + @player.width/2 - @bullet_array[i][0].width/2
                @bullet_array[i][5] = @player.y + @player.height/2 - @bullet_array[i][0].height/2
                @bullet_array[i][0].rotate = rotate_angle
                @bullet_array[i][1] = true
                @bullet_array[i][2] = unit_vector[0]
                @bullet_array[i][3] = unit_vector[1]
                # @bullet_hitbox_array[i].x = @bullet_array[i][0].x
                # @bullet_hitbox_array[i].y = @bullet_array[i][0].y
                @bullet_hitbox_array[i].rotate = @bullet_array[i][0].rotate

                @ammo_mag -= 1 

                i = @bullet_array.length
            end
            i += 1
        end
    end
    when :middle

    when :right

    end
end

i = 0
update do
    mousex = get :mouse_x
    mousey = get :mouse_y
    player_center_array = [(@player.x + @player.width/2), (@player.y + @player.height/2)] # Kan komma att ändras i och med att mittpunkten/tyngdpunkten för sprites skiljer sig. 
    rotate_angle = mouse_angle(mousex, mousey, player_center_array)[0]
    unit_vector = mouse_angle(mousex, mousey, player_center_array)[1]
    @player.rotate = rotate_angle


    if (@right - @left).abs == (@down - @up).abs
        @x_dir = (@right - @left) * 0.70 # typ roten ur 2 dividerat på 2
        @y_dir = (@down - @up) * 0.70 
    else
        @x_dir = (@right - @left) 
        @y_dir = (@down - @up)
    end 
    
    @map.x -= @x_dir * @walk_speed
    @map.y -= @y_dir * @walk_speed

    

    if @reload == 1
        @reload_time += 1
        if @reload_time >= 60
            @ammo_mag = 30
            @ammo_total -= 30
            @reload = 0
            @reload_time = 0
        end
    end

    i = 0
    while i < @bullet_array.length
        if @bullet_array[i][0].x > Window.width || @bullet_array[i][0].x < 0 || @bullet_array[i][0].y > Window.height || @bullet_array[i][0].y < 0
            @bullet_array[i][1] = false
        end
        if @bullet_array[i][1] == true
            @bullet_array[i][4] += @bullet_array[i][2] * @bullet_speed
            @bullet_array[i][5] +=  @bullet_array[i][3] * @bullet_speed
            @bullet_array[i][0].add
            # @bullet_hitbox_array[i].x = @bullet_array[i][0].x
            # @bullet_hitbox_array[i].y = @bullet_array[i][0].y
            
        else
            @bullet_array[i][0].remove
        end
        i += 1
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

    xy_array = xy_translate(@enemy_1, @enemy_1_x, @enemy_1_y, @map)
    @enemy_1.x = xy_array[0]
    @enemy_1.y = xy_array[1]
    
    i = 0
    while i < @bullet_array.length
        xy_array = xy_translate(@bullet_array[i][0], @bullet_array[i][4], @bullet_array[i][5], @map)
        @bullet_array[i][0].x = xy_array[0]
        @bullet_array[i][0].y = xy_array[1]
        i += 1
    end


    #Hit collison Enviorment
    hitbox_update_characters = 0
    hitbox_update_collision_boxes = 0
    while hitbox_update_characters < @characters_array.length
        while hitbox_update_collision_boxes < @hitbox_array.length
            if collision(@characters_array[hitbox_update_characters], @hitbox_array[hitbox_update_collision_boxes])
                @hit_collision_test = 1
            end
            hitbox_update_collision_boxes += 1
        end
        hitbox_update_collision_boxes = 0
        hitbox_update_characters += 1
    end

    

    #Här är debugging kod
    @text.remove
    @text = Text.new(
    #    "#{(get :fps).to_i} #{mouse_angle(mousex, mousey, player_center_array).to_i}",
        "#{(get :fps).to_i} #{rotate_angle.to_i} #{@ammo_mag}/#{@ammo_total} #{@enemy_array[0][1]} #{@hit_collision_test}",
        x: 20, y: 20,
        style: 'bold',
        size: 40,
        color: 'blue',
    )
end

show

