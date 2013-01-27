function [functionValues, count] = refreshFunctionValues(simplex, f, ...
    minPointIndex, minValue, count)
    functionValues = [];
    for i = 1:1:3
        if i == minPointIndex
            functionValues = [functionValues, minValue];
        else
            point = simplex(i,:);
            [newValue, count] = getFunctionValue(f, point, count);
            functionValues = [functionValues, newValue];
        end
    end
end

