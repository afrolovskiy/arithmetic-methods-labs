function [value] = calcSecondDerivative(lastF, curF, nextF, h)
    value = (nextF - 2*curF + lastF) / h^2;
end

