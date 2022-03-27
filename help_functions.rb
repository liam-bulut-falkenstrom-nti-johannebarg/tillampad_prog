def mouse_angle(mouse_x, mouse_y, player_center_array)
    dist_x = mouse_x - player_center_array[0]
    dist_y = mouse_y - player_center_array[1]
    vector = Math.sqrt(dist_x**2 + dist_y**2)
    angle = Math.atan(dist_y/dist_x) * (180/(Math::PI))
    unit_vector = [dist_x/vector, dist_y/vector]
    if dist_x >= 0
        return [angle, [unit_vector[0], unit_vector[1]], [dist_x, dist_y]] 
    else
        angle = -90 - (90 - Math.atan(dist_y/dist_x) * (180/(Math::PI))) 
        return [angle, [unit_vector[0], unit_vector[1]], [dist_x, dist_y]]
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

def collision_dir_x(object_1, object_2, dir_x, dir_y)
    i = 8
    object_1_y = 0
    if dir_y < 0
        object_1_y = object_1.y
        object_1_y = object_1_y + 8
    elsif dir_y > 0
        object_1_y = object_1.y
        object_1_y = object_1_y - 8
    elsif dir_y == 0
        object_1_y = object_1.y 
    end
    while i >= 0
        if collision_player(object_1, object_2, object_1.x, object_1_y) == false
            return 8-i
        end 
        # p "Direction y: #{dir_y}"
        if dir_x > 0
            object_1.x = object_1.x - 1 
        elsif dir_x < 0
            object_1.x = object_1.x + 1 
        end
        i -= 1
    end
    if dir_x > 0
        object_1.x = object_1.x + 9 
    elsif dir_x < 0
        object_1.x = object_1.x - 9 
    end
    return 9
end

def collision_dir_y(object_1, object_2, dir_y, dir_x)
    i = 8
    object_1_x = 0
    if dir_x < 0
        object_1_x = object_1.x
        object_1_x = object_1_x + 8
    elsif dir_x > 0
        object_1_x = object_1.x 
        object_1_x = object_1_x - 8
    elsif dir_x == 0
        object_1_x = object_1.x 
    end
    while i >= 0
        if collision_player(object_1, object_2, object_1_x, object_1.y) == false
            return 8-i
        end 
        # p "Direction y: #{dir_y}"
        if dir_y > 0
            object_1.y = object_1.y - 1 
        elsif dir_y < 0
            object_1.y = object_1.y + 1 
        end
        i -= 1
    end
    if dir_y > 0
        object_1.y = object_1.y + 9 
    elsif dir_y < 0
        object_1.y = object_1.y - 9 
    end
    return 9
end

def collision_player(object_1, object_2, object_1_x, object_1_y)
    if object_2.y + object_2.height > object_1_y && object_2.y < object_1_y + object_1.height
        if  object_2.x + object_2.width > object_1_x && object_2.x < object_1_x + object_1.width           
            return true
        end
    end
    return false
end
     
def xy_translate(object_x, object_y, relative_plain)
    return [(relative_plain.x + object_x), (relative_plain.y + object_y)] 
end

def hover(musx, musy, button)
    if musx > button.x && musx < button.x + button.width
        if musy > button.y && musy < button.y + button.height
            return true
        end
        return false
    end
end