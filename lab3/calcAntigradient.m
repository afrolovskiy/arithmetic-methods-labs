function [derivative, count] = calcAntigradient(func, xCur, count)
    h = getH();
    fCur = func(xCur); 
    fNext1 = func(xCur + h * [1, 0]);
    fNext2 = func(xCur + h * [0, 1]);
    derivative(1) = calcRightFirstDerivative(fCur, fNext1, h);
    derivative(2) = calcRightFirstDerivative(fCur, fNext2, h);
    count = count + 3;    
end

