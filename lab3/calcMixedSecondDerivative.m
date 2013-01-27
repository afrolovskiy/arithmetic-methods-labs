function [value] = calcMixedSecondDerivative(f, fX1, fX2, fX1X2, h)
    value = (fX1X2 - fX1 - fX2 + f) / h^2;
end

