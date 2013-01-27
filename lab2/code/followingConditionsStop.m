function [result] = followingConditionsStop(edgeLength, eps1, functionValues, minValueIndex, eps2)
    result = false;
    if edgeLength < eps1
        minValue = functionValues(minValueIndex);
        
        variance = 0;
        for i = 1:1:3
            if i ~= minValueIndex
                curValue = functionValues(i);
                variance = (minValue - curValue).^2;
            end
        end
        variance = variance / 2;
       
        if variance < eps2
            result = true;
        end
    end
end

