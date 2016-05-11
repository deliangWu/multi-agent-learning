function rl(trial)
    for i = 1:trial
        v_plot = env_skating(0,0);
        if i == 1
            sum_v = v_plot;
        else
            sum_v = sum_v + v_plot;
        end
    end
    anv_v = sum_v / trial;
    
    % plot the cumulative payoff of each action
    [row_anv_v,col_anv_v] = size(anv_v);
    hold on
    for i = 1:col_anv_v
        plot(1:row_anv_v,anv_v(:,i));
    end
    hold off
end