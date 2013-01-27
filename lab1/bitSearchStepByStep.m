function [xmin, fmin, count] = bitSearchStepByStep(func, xBegin, xEnd, eps)
    x = 0.0:0.01:1.0;
    y = func(x);
    hold off
    figure;
    plot(x, y); 
    hold on

    h = (xEnd-xBegin) / 4;
    x = xBegin;
    count = 0; % count of function calculation
    fOld = func(x); count = count + 1;
    
    plot(x, func(x), 'b:*');
            
    while abs(h) >= eps
        x = x + h;
        if (x <= xBegin) || (x >= xEnd)
           h = (-h) / 4;
        else
            fNew = func(x); count = count + 1;
            if (fNew > fOld)  
                h = (-h) / 4;
            end
            fOld = fNew;
        end
         plot(x, func(x), 'b:*');
    end
    xmin = x;
    fmin = func(x);
end

