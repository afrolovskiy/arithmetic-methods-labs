function [result] = f2(x)
    result = x(2)^3 + 2*x(2)*x(1) + 1/sqrt(x(2)*x(1)) + x(1);
end