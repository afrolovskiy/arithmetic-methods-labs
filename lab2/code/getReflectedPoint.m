function [reflectedPoint] = getReflectedPoint(simplex, reflectedPointIndex)
    xc = getCenterOfGravity(simplex, reflectedPointIndex);   
    reflectedPoint = [];
    for j = 1:1:2
        oldCoordinateValue = simplex(reflectedPointIndex, j);
        newCoordinateValue = oldCoordinateValue  + ...
            2 * (xc(j) - oldCoordinateValue);
        reflectedPoint = [reflectedPoint, newCoordinateValue];
    end
end

