function [value] = f1(x)
    value = 4*x(1)*x(2) + 7*x(1)^2 + 4*x(2)^2 + ...
             6*sqrt(5)*x(1) - 12*sqrt(5)*x(2) + 51;
end

