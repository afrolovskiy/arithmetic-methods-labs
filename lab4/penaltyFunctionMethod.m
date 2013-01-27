function [xmin, fmin, count, iteration] = penaltyFunctionMethod(f, startPoint, Ak, C, eps, maxIterationCount)
    count = 0;
    x = [startPoint];
    lastX = startPoint;
    iteration = 1;
    flgEndSearch = false;
    while ~flgEndSearch
        if iteration > maxIterationCount
            break;
        else
            iteration = iteration + 1;
        end
        
        fi = @(x)(f(x) + finalPenaltyFunction(Ak, x));
        [curX, curF, tmp, output] = fminsearch(fi, lastX, ...
            optimset('TolX', 1e-4));
        count = count + output.funcCount; 
        x = [x, curX];
         
        %if mod(iteration, 2) == 0
            index = round(iteration / 2); %floor
            xk = x(index);
            x2k = x(iteration);
            if norm(x2k - xk) < eps
                flgEndSearch = true;
            end
        %end
        %if abs(f(curX) - f(lastX)) < eps %abs(lastX - curX) < eps
        %    break;
        %end
        
        drawLine(lastX, curX, 'r');
        
        Ak = Ak + C;
        lastX = curX;
    end
    xmin = curX;
    fmin = f(xmin);
    count = count + 1;
end

