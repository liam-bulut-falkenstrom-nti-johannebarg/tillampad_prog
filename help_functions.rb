def mouse_angle(mouse_x, mouse_y, player_center_array)
    dist_x = mouse_x - player_center_array[0]
    dist_y = mouse_y - player_center_array[1]
    if dist_x >= 0
        angle = Math.atan(dist_y/dist_x) * (180/(Math::PI))
        return [angle, dist_x, dist_y] 
    else
        angle = -90 - (90 - Math.atan(dist_y/dist_x) * (180/(Math::PI))) 
        return [angle, dist_x, dist_y]
    end 
end

