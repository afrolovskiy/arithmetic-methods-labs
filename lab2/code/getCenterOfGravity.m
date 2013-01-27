function [xc] = getCenterOfGravity(simplex, reflectedPointIndex)
    xc = [];
    for j = 1:1:2
        sum = 0;
        for i = 1:1:3
            if i ~= reflectedPointIndex
                sum = sum + simplex(i,j); 
            end
        end
        xc = [xc, sum / 2];
    end
end

