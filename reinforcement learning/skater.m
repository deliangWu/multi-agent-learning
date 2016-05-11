function [new_location,new_v] = skater(v,location,Action_list,ID,move_distance,rink_length,rink_width,col_r,R1,R2)
    % skater choose an action from action list
    if (ID ~= 1)
        [action,e] = decisionMaking(Action_list,v);
    else
        [action,e] = decisionMaking(Action_list,v);
        %[action,e] = decisionMaking2(Action_list);
    end
    % skater move forward according the selected action
    nxt_location = move(location,ID,move_distance,rink_length,rink_width,action);
    % skater detect whether (s)he will collide with any other skater after
    % movement
    col = collision_detection(nxt_location,ID,col_r,rink_length,rink_width);

    % if the movement will cause collision, then don't execute the action
    discount_factor = 0.995;
    if (col == true)
        new_v = discount_factor*v + R2*e;
        new_location = location;
        %disp('collision');
        %disp(location);
        %disp(nxt_location);
    else
        new_v = discount_factor*v + R1*e;
        new_location = nxt_location;
    end
end