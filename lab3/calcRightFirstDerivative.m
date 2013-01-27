function [value] = calcRightFirstDerivative(fCur, fNext, h)
    value = (fNext - fCur) / h;
end

