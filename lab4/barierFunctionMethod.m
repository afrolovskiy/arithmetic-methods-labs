function [xmin, fmin, count, iteration] = barierFunctionMethod(f, startPoint, Bk, C, eps, maxIterationCount)
    count = 0;
    x = [startPoint];
    lastX = startPoint;
    iteration = 1;
    flgEndSearch = false;
    %pause on
    while ~flgEndSearch
        if iteration > maxIterationCount
            break;
        else
            iteration = iteration + 1;
        end
        
        fi = @(x)(f(x) + finalBarierFunction(Bk, x));
        [curX, curF, tmp, output] = fminsearch(fi, lastX, ...
                                        optimset('TolX', 1e-5));

        count = count + output.funcCount; 
        x = [x, curX];
         
        %if mod(iteration, 2) == 0
            lastIndex = round(iteration / 2); %floor
            xk = x(lastIndex);
            x2k = x(iteration);
            if norm(x2k - xk) < eps
                flgEndSearch = true;
            end
        %end
        
        %if abs(f(curX) - f(lastX)) < eps
        %    break
        %end
        
        drawLine(lastX, curX, 'r');
 %       pause
        
        Bk = Bk / C;
        lastX = curX;
    end
%    pause off
    xmin = curX;
    fmin = f(xmin); 
    count = count + 1;
end

