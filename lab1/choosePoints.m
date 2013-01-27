function [x1, x2, x3, f1, f2, f3] = choosePoints(x1, x2, x3, x, f1, f2, f3, fx)
    if (x > x2) && (x <= x3)
        if fx <= f2
           x1 = x2;
           f1 = f2;
           x2 = x;
           f2 = fx;
        else
           x3 = x; 
           f3 = fx;
        end
    elseif (x >= x1) && (x <= x2)
       if fx <= f2
           x3 = x2;
           f3 = f2;
           x2 = x;
           f2 = fx;
       else
           x1 = x;
           f1 = fx;
       end 
   end
end