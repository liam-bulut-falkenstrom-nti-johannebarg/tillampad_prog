require 'ruby2d'
require_relative "startup_setup.rb"

set width: 1366
set height: 768

on :mouse_down do |event|
    case event.button
    when :left
        @click = true
    when :middle

    when :right

    end
end

on :mouse_up do |event|
    case event.button
    when :left
        @click = false
    when :middle

    when :right

    end
end


update do

    

    def hover(musx, musy, button)
        if musx > button.x && musx < button.x + button.width
            if musy > button.y && musy < button.y + button.height
                return true
            end
            return false
        end
    end

    if @main_menu == true
        @button_easy.remove
        @button_easy_hover.remove
        @button_hard.remove
        @button_hard_hover.remove
        @button_doom.remove
        @button_doom_hover.remove
        @button_return.remove
        @button_return_hover.remove
        @button_controls.remove
        @button_controls_hover.remove
        @button_volum.remove
        @button_volum_hover.remove

    if hover((get :mouse_x), (get :mouse_y), @button_play) == true
        @button_play.remove
    else
        @button_play.add
    end

    if hover((get :mouse_x), (get :mouse_y), @button_settings) == true
        @button_settings.remove
    else
        @button_settings.add
    end

    if hover((get :mouse_x), (get :mouse_y), @button_exit) == true
        @button_exit.remove
    else
        @button_exit.add
    end

    if hover((get :mouse_x), (get :mouse_y), @button_play) == true && @click == true
        @main_menu = false
        @button_play.remove
        @button_play_hover.remove
        @button_settings.remove
        @button_settings_hover.remove
        @button_exit.remove
        @button_exit_hover.remove
        @play_menu = true
        @click = false
    end

    if hover((get :mouse_x), (get :mouse_y), @button_settings) == true && @click == true
        @main_menu = false
        @button_play.remove
        @button_play_hover.remove
        @button_settings.remove
        @button_settings_hover.remove
        @button_exit.remove
        @button_exit_hover.remove
        @settings_menu = true
        @click = false
    end

    if hover((get :mouse_x), (get :mouse_y), @button_exit) == true && @click == true
        exit
    end
end

    if @play_menu == true
        @button_easy.add
        @button_easy_hover.add
        @button_hard.add
        @button_hard_hover.add
        @button_doom.add
        @button_doom_hover.add
        @button_return.add
        @button_return_hover.add

        if hover((get :mouse_x), (get :mouse_y), @button_easy) == true
            @button_easy.remove
        else
            @button_easy.add
        end

        if hover((get :mouse_x), (get :mouse_y), @button_hard) == true
            @button_hard.remove
        else
            @button_hard.add
        end

        if hover((get :mouse_x), (get :mouse_y), @button_doom) == true
            @button_doom.remove
        else
            @button_doom.add
        end

        if hover((get :mouse_x), (get :mouse_y), @button_return) == true
            @button_return.remove
        else
            @button_return.add
        end

        if hover((get :mouse_x), (get :mouse_y), @button_return) == true && @click == true
            @play_menu = false
            @main_menu = true
            @click = false
            @button_play_hover.add
            @button_settings_hover.add
            @button_exit_hover.add
        end
    

    #     if hover((get :mouse_x), (get :mouse_y), @button_easy) == true && @click == true

    #     if hover((get :mouse_x), (get :mouse_y), @button_hard) == true && @click == true

    #     if hover((get :mouse_x), (get :mouse_y), @button_doom) == true && @click == true    
    # end
    end

    if @settings_menu == true
        @button_controls.add
        @button_controls_hover.add
        @button_volum.add
        @button_volum_hover.add
        @button_return.add
        @button_return_hover.add

        if hover((get :mouse_x), (get :mouse_y), @button_controls) == true
            @button_controls.remove
        else
            @button_controls.add
        end

        if hover((get :mouse_x), (get :mouse_y), @button_volum) == true
            @button_volum.remove
        else
            @button_volum.add
        end

        if hover((get :mouse_x), (get :mouse_y), @button_return) == true
            @button_return.remove
        else
            @button_return.add
        end

        if hover((get :mouse_x), (get :mouse_y), @button_return) == true && @click == true
            @settings_menu = false
            @main_menu = true
            @click = false
            @button_play_hover.add
            @button_settings_hover.add
            @button_exit_hover.add
        end



    end


#Kod som körs varje frame. tänk dig en while loop som loopar varje frame, här är basically all kod.
end

show #visar på skärmen

