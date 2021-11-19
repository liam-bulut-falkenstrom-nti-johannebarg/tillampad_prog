# Hej klassen! Välkommen till spelet!
require 'ruby2d'
require_relative "setup_var.rb"
require_relative "help_functions.rb"

set width: 200
set height: 120
set resizable: true
# set viewport_width: 100

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
                
                @bullet_array[i][0].x = @player.x
                @bullet_array[i][0].y = @player.y
                @bullet_array[i][0].rotate = rotate_angle
                @bullet_array[i][1] = true
                @bullet_array[i][2] = unit_vector[0]
                @bullet_array[i][3] = unit_vector[1]

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
    @player.x += @x_dir * @walk_speed
    @player.y += @y_dir * @walk_speed

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
            @bullet_array[i][0].x += @bullet_array[i][2] * @bullet_speed
            @bullet_array[i][0].y += @bullet_array[i][3] * @bullet_speed
            @bullet_array[i][0].add
        else
            @bullet_array[i][0].remove
        end
        i += 1
    end


    #Här är debugging kod
    @text.remove
    @text = Text.new(
    #    "#{(get :fps).to_i} #{mouse_angle(mousex, mousey, player_center_array).to_i}",
        "#{(get :fps).to_i} #{mouse_angle(mousex, mousey, player_center_array)[0]} #{@ammo_mag}/#{@ammo_total}",
        x: 20, y: 20,
        style: 'bold',
        size: 8,
        color: 'blue',
    )
end

show

