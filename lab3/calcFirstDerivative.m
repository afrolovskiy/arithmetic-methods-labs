function [value] = calcFirstDerivative(lastF, nextF, h)
    value = (nextF - lastF) / (2*h);
end

