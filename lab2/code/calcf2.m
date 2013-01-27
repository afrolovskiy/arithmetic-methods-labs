function [result] = calcf2(x)
    if x(1) <= 1e-5 || x(2) <= 1e-5 || x(1) * x(2) < 0
        result = bitmax;
    else
        result = x(2)^3 + 2*x(2)*x(1) + 1/sqrt(x(2)*x(1)) + x(1);
    end
end