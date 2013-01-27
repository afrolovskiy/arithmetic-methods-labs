function [value, count] = getFuncLeft(f, x, h, count)
    value = f(x - h);
    count = count + 1;
end

