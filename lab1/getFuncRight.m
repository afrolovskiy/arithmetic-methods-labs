function [value, count] = getFuncRight(f, x, h, count)
    value = f(x + h);
    count = count + 1;
end

