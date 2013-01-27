function [value] = getFirstDerivative(fLeft, fRight, h)
    value = (fRight - fLeft) / (2 *  h);    
end