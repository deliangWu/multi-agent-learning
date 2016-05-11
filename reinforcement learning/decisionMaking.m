function [action,e] = decisionMaking(actionList,v)
    [Null,len_AL] = size(actionList);    
    % calculate the probability for each action
    if (min(v) < 0)
        v_new = v - min(v);
    else
        v_new = v;
    end
    % if the sum of cumulative payoff of all actions if 0, then give every
    % action the same probability
    if (sum(v_new) < 1)
        p = 1/len_AL * ones(1,len_AL);
    else
        p = v_new / sum(v_new);
    end
    
    pcum = cumsum(p);
    select = find(pcum >= rand);
    
    %rand_loc = randi(len_AL);
    rand_loc = select(1);
    action = actionList(rand_loc);
    for i = 1:len_AL
        if (i == rand_loc)
            e(i) = 1;
        else
            e(i) = 0;
        end
    end
end