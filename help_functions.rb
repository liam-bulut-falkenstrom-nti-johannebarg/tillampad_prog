def mouse_angle(mouse_x, mouse_y, player_center_array)
    dist_x = mouse_x - player_center_array[0]
    dist_y = mouse_y - player_center_array[1]
    vector = Math.sqrt(dist_x**2 + dist_y**2)
    angle = Math.atan(dist_y/dist_x) * (180/(Math::PI))
    unit_vector = [dist_x/vector, dist_y/vector]
    if dist_x >= 0
        return [angle, [unit_vector[0], unit_vector[1]]] 
    else
        angle = -90 - (90 - Math.atan(dist_y/dist_x) * (180/(Math::PI))) 
        return [angle, [unit_vector[0], unit_vector[1]]]
    end 
end

def collision(object_1_x, object_1_y, object_2_x, object_2_y)
    if object_2_y + object_2_height > object_1_y && object_2_y < object_1_y + object_1_height
        if  object_2_x + object_2_width > object_1_x && object_2_x < object_1_x + object_1_width            
            return true
        end
    end
    return false
end