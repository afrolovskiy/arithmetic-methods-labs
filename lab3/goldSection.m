function [xmin, fmin, count] = goldSection(func, xBegin, xEnd, eps)
    tau = getTau();
    a = xBegin;
    b = xEnd;
    h = b - a;
    
    x1 = b - tau*h;
    x2 = a + tau*h;   
    count = 0; % count of function calcultion
    f1 = func(x1); count = count + 1; 
    f2 = func(x2); count = count + 1;
    
    while abs(b - a) >= eps 
        if (f1 < f2) 
            b = x2;
            x2 = x1;
            f2 = f1; 
            x1 = b - tau*(b - a);
            f1 = func(x1); count = count + 1;
        else
            a = x1;
            x1 = x2;
            f1 = f2;
            x2 = a + tau*(b - a);
            f2 = func(x2); count = count + 1;
        end
    end
    
    xmin = (x1 + x2) / 2.0;
    fmin = func(xmin); count = count + 1; 
end
