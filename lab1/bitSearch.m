function [xmin, fmin, count] = bitSearch(func, xBegin, xEnd, eps)
    h = (xEnd-xBegin) / 4;
    x = xBegin;
    count = 0; % count of function calculation
    fOld = func(x); count = count + 1;
    flg = true;
    flg1 = false;
    while flg        
        x = x + h;
        if (x <= xBegin) || (x >= xEnd)
            if flg1
                flg = false;
            end
            h = (-h) / 4;
            if abs(h) < eps
               flg = false;
            end
        else
            fNew = func(x); count = count + 1;
            if (fNew > fOld)
                if flg1
                    flg = false;
                end
                h = (-h) / 4;
                if abs(h) < eps
                    flg1 = true;
                end
            end
            fOld = fNew;
        end
        
    end
    % но это не га
    xmin = x + h;
    fmin = func(x);
end

