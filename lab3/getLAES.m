function [A, B, count] = getLAES(func, x, h)
       
    f1 = func(x + h * [0, -1]);
    f2 = func(x + h * [-1, 0]);
    f3 = func(x);
    f4 = func(x + h * [1, 0]);
    f5 = func(x + h * [0, 1]);
    f6 = func(x + h * [1, 1]);
    count = 6;
    
    % calc Gesse Matrix
    A(1, 1) = calcSecondDerivative(f2, f3, f4, h);
    A(2, 2) = calcSecondDerivative(f1, f3, f5, h);
    A(1, 2) = calcMixedSecondDerivative(f3, f4, f5, f6, h);
    A(2, 1) = A(1, 2);
    
    % calc first derivative
    B(1, 1) = calcFirstDerivative(f2, f4, h);
    B(2, 1) = calcFirstDerivative(f1, f5, h);
end

