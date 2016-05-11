% function for detecting collision between current skater and other skaters
% input arguments:
%     location is the set of location for each skater
%     ID is the current skater ID
%     col_r is the collision radius
% when the distance between current skater and any other skater is less
% than col_r, then col = true, else col = false
% dist = sqrt((x1 -x2)^2 + (y1 - y2)^2);
function col = collision_detection(location,ID,col_r,rink_length,rink_width)
    % get the size of location
    [r,] = size(location);
    % get the location of current skater
    x_c = location(ID,1);
    y_c = location(ID,2);
    col = false;
    for i = 1:r
        if (i ~= ID)
            % get the location of each other skaters
            x_o = location(i,1);
            y_o = location(i,2);
            % calculate the distance between current skater and other
            % skater
            dist_x1 = abs(x_c - x_o);
            dist_x2 = abs(min(x_c,x_o)+ rink_length - max(x_c,x_o));
            dist_x = min(dist_x1,dist_x2);
            dist_y1 = abs(y_c - y_o);
            dist_y2 = abs(min(y_c,y_o)+ rink_width - max(y_c,y_o));
            dist_y = min(dist_y1,dist_y2);
            dist = sqrt(dist_x.^2 + dist_y.^2);
            if dist < col_r
                col = true;
                %disp('collision');
            end
        end
    end
end