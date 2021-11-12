# Hej klassen! Välkommen till spelet!
require 'ruby2d'
require_relative "setup_var.rb"
require_relative "help_functions.rb"

set width: 400
set height: 240
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
i = 0
update do
    mousex = get :mouse_x
    mousey = get :mouse_y


    if (@right - @left).abs == (@down - @up).abs
        @x_dir = (@right - @left) * 0.70 # typ roten ur 2 dividerat på 2
        @y_dir = (@down - @up) * 0.70 
    else
        @x_dir = (@right - @left) 
        @y_dir = (@down - @up)
    end 
    @player.x += @x_dir * @walk_speed
    @player.y += @y_dir * @walk_speed

    @player.rotate = i
    i += 1


end

show