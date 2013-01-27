function [X] = getRegularSimplex(keypoint, a)
    X = [];
    d1 = a * (sqrt(3) - 1) / (2 * sqrt(2));
    d2 = a * (sqrt(3) + 1) / (2 * sqrt(2));
    for i = 1:1:2
        newPoint = [];
        for j = 1:1:2
            if i == j
                x = keypoint(j) + d2;
            else
                x = keypoint(j) + d1; 
            end
            newPoint = [newPoint, x];
        end
        X = [X; newPoint];
    end
    X = [X; keypoint];
end

