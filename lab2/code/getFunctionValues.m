function [functionValues, count] = getFunctionValues(func, simplex, count)
    functionValues = [];
    for i = 1:1:3
        point = simplex(i,:);
        value = func([point(1); point(2)]);
        functionValues = [functionValues, value]; 
    end
    count = count + 3;
end

