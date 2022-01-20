require 'ruby2d'
require_relative "startup_setup.rb"

set width: 1366
set height: 768

on :mouse_down do |event|
    case event.button
    when :left
        click = true
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

    if hover((get :mouse_x), (get :mouse_y), @button_play) == true
        @button_play.remove
    else
        @button_play.add
    end
    



#Kod som körs varje frame. tänk dig en while loop som loopar varje frame, här är basically all kod.
end

show #visar på skärmen

