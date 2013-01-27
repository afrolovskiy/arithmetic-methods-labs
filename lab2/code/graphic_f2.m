function [result] = graphic_f2(x1, x2)
    result = x2.^3 + 2.*x2.*x1 + 1./sqrt(x2.*x1) + x1;
end

