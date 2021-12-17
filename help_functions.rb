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

def collision(object_1, object_2)
    if object_2.y + object_2.height > object_1.y && object_2.y < object_1.y + object_1.height
        if  object_2.x + object_2.width > object_1.x && object_2.x < object_1.x + object_1.width            
            return true
        end
    end
    return false
end

def xy_translate(object, object_x, object_y, relative_plain)
    return [(relative_plain.x + object_x), (relative_plain.y + object_y)] 
end