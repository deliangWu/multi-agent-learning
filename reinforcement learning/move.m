function new_location = move(location,ID,move_distance,rink_length,rink_width,action)
    delta_x = move_distance * cos(action * pi / 180);
    delta_y = move_distance * sin(action * pi / 180);
    % copy the original location into new location
    new_location = location;
    % calculate the new location in x dimension
    if ((location(ID,1) + delta_x) > rink_length)
        new_location(ID,1) = location(ID,1) + delta_x - rink_length;
    elseif ((location(ID,1) + delta_x) < 0)
        new_location(ID,1) = location(ID,1) + delta_x + rink_length;
    else
        new_location(ID,1) = location(ID,1) + delta_x;
    end
    % calculate the new location in y dimension
    if ((location(ID,2) + delta_y) > rink_width)
        new_location(ID,2) = location(ID,2) + delta_y - rink_width;
    elseif ((location(ID,2) + delta_y) < 0)
        new_location(ID,2) = location(ID,2) + delta_y + rink_width;
    else
        new_location(ID,2) = location(ID,2) + delta_y;
    end
end