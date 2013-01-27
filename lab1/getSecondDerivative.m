function [value] = getSecondDerivative(fLeft, fCur, fRight, h)
    value = (fRight - 2 * fCur + fLeft) / h^2;
end