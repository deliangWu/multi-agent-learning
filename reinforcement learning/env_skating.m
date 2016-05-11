function env_skating(plot_en,single_trial)
    % 1. initialize the parameters of the skating environment
    % 1.1 define the skating rink
    rink_width  = 20;
    rink_length = 20;
    % 1.2 define number of skaters
    Num_skaters = 15;
    % 1.3 define valid action list
    Action_list = [0, 60, 120, 180, 240, 300];
    % 1.4 define the skating speed for each skater(same speed for each skater)
    speed = 10;          %6m/s
    % 1.5 define reward value R1(move wo collision) & R2(movement cause collision )
    R1 = 5;
    R2 = -10;
    % 1.6 define the collision radius r
    col_r = 2;
    
    % 2. initialize the starting location of each skater
    anv_l = round(rink_length/Num_skaters);
    for m = 1:Num_skaters
        location(m,:) = [(m-1)*anv_l + randi(anv_l),randi(rink_width)];
    end
    
    %3. initialize the initial payoff vector for each actions and each
    %skaters
    [Null,k] = size(Action_list);
    for s = 1:Num_skaters
        for a = 1:k
            v(s,a) = R1;
        end
    end
    
    % 4. create skaters
    move_distance = speed/5;
    
    LT = 10000;
    for t = 1:LT
        
        for s = 1:Num_skaters
            [location,v(s,:)] = skater(v(s,:),location,Action_list,s,move_distance,rink_length,rink_width,col_r,R1,R2);
        end
        
        % save the payoff over time
        v_plot(t,:) = sum(v,1);
        
        % display the progress bar
        if (mod(t,LT/100) == 0) 
            disp(round(t/(LT/100))); disp('%.......');
        end
        
        % plot the location of each skater
        if (plot_en)
            axis([0,rink_length,0,rink_width]);
            pause(0.05);
            hold off;
            plot(0,0);
            plot(location(:,1),location(:,2),'o');
            hold on;
        end
    end
    
    % 5. display the cumulative payoffs
    disp(v);
    [row_v,col_v] = size(v);
    for i = 1:row_v
        p = v(i,:) / sum(v(i,:));
        disp(p);
    end
    
    % plot the cumulative payoff of each action
    if (single_trial)
        [row_v_plot,col_v_plot] = size(v_plot);
        hold on
        title('Mean reward over all skaters for each action in action list');
        xlabel('time');
        ylabel('cumulative payoffs');
        for i = 1:col_v_plot
            plot(1:row_v_plot,v_plot(:,i));
        end
        legend(num2str(Action_list(1)),num2str(Action_list(2)),num2str(Action_list(3)),num2str(Action_list(4)),num2str(Action_list(5)),num2str(Action_list(6)),'Location','southeast');
        hold off
    end
end
