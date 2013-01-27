function [point] = calcNextPoint(curPoint, uniformVector, step, n)
    point = [];
    for j = 1:1:n
        point = [point, curPoint(j) + step * uniformVector(j)];
    end
end

