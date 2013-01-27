function [xmin, fmin, count] = conjugateGradientMethod(func, startPoint, eps, epsX, N, maxIterationCount)
    count = 0;
    iteration = 0;
    step = 0;
    curX = startPoint;
    lastX = curX;
    curP = [0, 0];
    flgFirst = true;
    startAlpha = -10;
    endAlpha = 10;
    while true
        if iteration > maxIterationCount
            break;
        else
            iteration = iteration + 1;
        end
        
        if ~flgFirst 
            fi = @(alpha)(func(curX + alpha * curP));
            [curAlpha, curF, count1] = goldSection(fi, startAlpha, endAlpha, 1e-6);
            count = count + count1;

            curX = curX + curAlpha * curP;
            
            drawLine(lastX, curX);
            
            deltaX = norm(curX - lastX);
            if deltaX < epsX
                break;
            end
        end

        [curOmega, count] = calcAntigradient(func, curX, count);

        if ~flgFirst 
            deltaOmega = norm(curOmega);
            if deltaOmega < eps
                break;
            end;
        end
             
        if flgFirst
            flgFirst = false;
        end
        
        if rem(step, N) == 0
            gamma = 0;
            step = 0;
        else
            gamma = norm(curOmega)^2 / norm(lastOmega)^2;
        end        
        
        curP =  curOmega + gamma * curP;

        lastX = curX;
        lastOmega = curOmega;    
        step = step + 1;
    end

    xmin = curX;
    fmin = curF;
end