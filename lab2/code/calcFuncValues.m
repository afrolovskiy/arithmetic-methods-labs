function [values, count] = calcFuncValues(func, points, pointsCount, count)
    values = [];
    for i = 1:1:pointsCount
        count = count + 1;
        point = points(i,:);
        values = [values, func(point)];
    end
end

