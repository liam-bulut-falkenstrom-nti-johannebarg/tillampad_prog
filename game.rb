# Hej klassen! Välkommen till spelet!
require 'ruby2d'
require_relative "setup_var.rb"
require_relative "help_functions.rb"

set width: 200
set height: 120
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
    # x and y coordinates of the mouse button event
    puts event.x, event.y
  
    # Read the button event
    case event.button
    when :left
        
    when :middle

    when :right

    end
end


update do
    mousex = get :mouse_x
    mousey = get :mouse_y
    player_center_array = [(@player.x + @player.width/2), (@player.y + @player.height/2)] # Kan komma att ändras i och med att mittpunkten/tyngdpunkten för sprites skiljer sig. 

    if (@right - @left).abs == (@down - @up).abs
        @x_dir = (@right - @left) * 0.70 # typ roten ur 2 dividerat på 2
        @y_dir = (@down - @up) * 0.70 
    else
        @x_dir = (@right - @left) 
        @y_dir = (@down - @up)
    end 
    @player.x += @x_dir * @walk_speed
    @player.y += @y_dir * @walk_speed

    @player.rotate = mouse_angle(mousex, mousey, player_center_array)[0]


    #Här är debugging kod
    @text.remove
    @text = Text.new(
        "#{(get :fps).to_i} #{mouse_angle(mousex, mousey, player_center_array).to_i}",
        x: 20, y: 20,
        style: 'bold',
        size: 10,
        color: 'blue',
    )
end

show

