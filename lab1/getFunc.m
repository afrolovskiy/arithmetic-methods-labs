function [value, count] = getFunc(f, x, count)
    value = f(x);
    count = count + 1;
end