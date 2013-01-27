function [value, count] = getFunctionValue(func, point, count)
    value = func([point(1); point(2)]);
    count = count + 1;
end

