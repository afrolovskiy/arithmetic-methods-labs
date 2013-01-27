function [simplex, functionValues, count] = relaxSimplex(func, simplex, functionValues, count)
    % stub for 2D case
    [maxValue, maxValueIndex] = max(functionValues);
    minPoints = [];
    for i = 1:1:3
        if i ~= maxValueIndex
            minPoints = [minPoints; simplex(i, :)];
        end       
    end
    
    point1 = minPoints(1,:);
    point2 = minPoints(2,:);
    vector = getVector(point1, point2, 2);
    edgeLength = calcVectorLength(vector, 2);
    
    [minValue, minValueIndex] = min(functionValues);
    startPoint = simplex(minValueIndex, :);
    simplex = getRegularSimplex(startPoint, edgeLength);
    [functionValues, count] = getFunctionValues(func, simplex, count);
end

