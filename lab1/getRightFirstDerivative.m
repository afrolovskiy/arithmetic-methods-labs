function [value] = getRightFirstDerivative(fLeft, fRight, h)
    value = (fRight - fLeft) / h;
end

