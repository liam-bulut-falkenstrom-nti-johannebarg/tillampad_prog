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
            # p "Kollision True"     
            return true
        end
    end
    # p "Kollision False"
    return false
end

def collision_dir(object_1, object_2, dir)

    i = 0
    while i <= 20
        p "Direction: #{dir}"
        if dir == 0
            object_1.x = object_1.x - 1 
            p "kollision höger"
        elsif dir == 1
            p "kollision vänster"
            object_1.x = object_1.x + 1 
        elsif dir == 2
            object_1.y = object_1.y - 1 
        elsif dir == 3
            object_1.y = object_1.y + 1 
        end
            
        if collision(object_1, object_2) == false
            return i
        end 
        i += 1
    end
    return 21
end

def collision_dir_x(object_1, object_2, dir_x)
    i = 8
    while i >= 0
        if collision(object_1, object_2) == false
            return 8-i
        end 
        # p "Direction: #{dir_x}"
        if dir_x > 0
            object_1.x = object_1.x - 1 
            # p "kollision höger"
        elsif dir_x < 0
            # p "kollision vänster"
            object_1.x = object_1.x + 1 
        end
        i -= 1
    end
    return false
end

def collision_dir_y(object_1, object_2, dir_y)
    i = 8
    while i >= 0
        if collision(object_1, object_2) == false
            return 8-i
        end 
        p "Direction: #{dir_y}"
        if dir_y > 0
            object_1.y = object_1.y - 1 
            # p "kollision ner"
        elsif dir_y < 0
            # p "kollision upp"
            object_1.y = object_1.y + 1 
        end
        i -= 1
    end
    return false
end
     
def xy_translate(object_x, object_y, relative_plain)
    return [(relative_plain.x + object_x), (relative_plain.y + object_y)] 
end