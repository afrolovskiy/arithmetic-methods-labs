function [xmin, fmin, count] = newtonMethod(func, startPoint, h, eps, maxIterationCount)
    count = 0;
    curX = startPoint;
    lastX = curX;
    iteration = 0;
    startAlpha = -10;
    endAlpha = 10;
    while true
        if iteration > maxIterationCount
            break;
        else
            iteration = iteration + 1;
        end
        
        [A, B, count1] = getLAES(func, curX, h);
        count = count + count1;
        
        if norm(transpose(B)) <= eps
            break;
        end        
        
        p = -(A\B);
                
        fi = @(alpha)(func(curX + alpha * transpose(p)));
        %[alpha, curF, count1] = goldSection(fi, startAlpha, endAlpha, 1e-6);
        [alphaMin, fmin, tmp, output] =  fminbnd(fi, startAlpha, ...
                                        endAlpha, optimset('TolX', 1e-6));
        count1 = output.funcCount;
        count = count + count1;        
        
        curX = curX + alphaMin * transpose(p);
        
        drawLine(lastX, curX);
        
        lastX = curX;
    end
    
    xmin = curX;
    fmin = func(xmin);
end

