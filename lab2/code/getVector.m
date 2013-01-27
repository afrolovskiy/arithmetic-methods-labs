function [vector] = getVector(point1, point2, n)
    vector = [];
    for i = 1:1:n
        vector = [vector, point1(i) - point2(i)];
    end
end

