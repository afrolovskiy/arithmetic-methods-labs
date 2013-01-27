function [a, b, c] = calculateKoefficients(x1, x2, x3, f1, f2, f3)
    %r12 = x1 - x2;
    %r23 = x2 - x3;
    %r31 = x3 - x1;
    %s12 = x1 + x2;
    %s23 = x2 + x3;
    %s31 = x3 + x1;
    %a = f1 / (r12*(-r31))+ f2 / ((-r12)*r23) + f3 / (r31*(-r23));
    %b = f1*s23 / (r12*r31) + f2*s31 / ((-r12)*(-r23)) + f3*s12 / (r31*r23);
    %c = f1*x2*x3/(r12*(-r31)) + f2*x3*x1/((-r12)*(r23)) + f3*x1*x2/((r31)*(-r23));
  
    A = [x1^2, x1, 1; x2^2, x2, 1; x3^2, x3, 1];
    b = [f1; f2; f3];
    X = A \ b;
    a = X(1);
    b = X(2);
    c = X(3);
  
  %X = inv(A)*b;
  %a = X(1);
  %b = X(2);
  %c = X(3);
end