function [value] = drawedF1(x, y)
    value = 4.*x.*y + 7.*x.^2 + 4.*y.^2 + ...
             6.*sqrt(5).*x - 12.*sqrt(5).*y + 51;
end
