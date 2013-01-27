function [xmin, fmin, count] = quadraticInterpolation(func, xBegin, xEnd, eps)
    count = 0;
    x1 = xBegin;
    x3 = xEnd;  
    
    flgExecution = true;
    while getDistance(x1, x3) >= eps && flgExecution
        [x1, f1, x2, f2, x3, f3, count] = goldSectionPart(func, x1, x3, eps, 3, count); 

        if getDistance(x1, x3) < eps 
            flgExecution = false;
        else    
            flgIsNeededGoldSection = false;
            while getDistance(x1, x3) >= eps && not(flgIsNeededGoldSection)
                [x, fx, count] = getTop(func, x1, x2, x3, f1, f2, f3,count);

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