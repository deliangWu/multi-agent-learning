function [action,e] = decisionMaking2(actionList)
    [Null,len_AL] = size(actionList);
    %rand_loc = randi(len_AL);
    rand_loc = 4;
    action = actionList(rand_loc);
    for i = 1:len_AL
        if (i == rand_loc)
            e(i) = 1;
        else
            e(i) = 0;
        end
    end
end