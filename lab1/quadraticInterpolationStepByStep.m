function [xmin, fmin, count] = quadraticInterpolationStepByStep(func, xBegin, xEnd, eps)
    x = 0.0:0.01:1.0;
    y = func(x);
    hold off
    figure;
    plot(x, y); 
    hold on
        
    count = 0;
    x1 = xBegin;
    x3 = xEnd; 
               
    flgExecution = true;
    while getDistance(x1, x3) >= eps && flgExecution
        [x1, f1, x2, f2, x3, f3, count] = goldSectionPartStepByStep(func, x1, x3, eps, 3, count); 
        plot(x1, func(x1), 'g:*');  
        plot(x2, func(x2), 'g:*');  
        plot(x3, func(x3), 'g:*');  
            
        if getDistance(x1, x3) < eps 
            flgExecution = false;
        else    
            flgIsNeededGoldSection = false;
            while getDistance(x1, x3) >= eps && not(flgIsNeededGoldSection)
                [x, fx, count] = getTop(func, x1, x2, x3, f1, f2, f3,count);
                 plot(x1, func(x1), 'g:*');  
                 plot(x2, func(x2), 'g:*');  
                 plot(x3, func(x3), 'g:*');
                 plot(x, f(x), 'g:*')

                if (x < x1) || (x > x3)
                    flgIsNeededGoldSection = true;
                else
                    [x1, x2, x3, f1, f2, f3] = choosePoints(x1, x2, x3, x, f1, f2, f3, fx);
                end
            end
        end
    end
    
    xmin = (x1 + x3)/2.0;
    fmin = func(xmin); count = count + 1;      
end