function [minPoint, minValue, count] = randomBacktrackingMethod(func, startPoint, step, alpha, maxAttemptsCount, eps, n, maxIterationCount)
    count = 0;
    curPoint = startPoint;
    curValue = func(curPoint); count = count + 1;
    flgEndSearch = false;
    iteration = 0;
    while ~flgEndSearch        
        if iteration > maxIterationCount
            break;
        else
            iteration = iteration + 1;
        end
        
        flgSuccess = false;        
        for i = 1:1:maxAttemptsCount
            p = generateUniformVector(n);
            nextPoint = calcNextPoint(curPoint, p, step, n);
            nextValue = func(nextPoint); count = count + 1;
            
            if nextValue < curValue
                drawLine(curPoint, nextPoint);
                flgSuccess = true;
                curValue = nextValue;
                curPoint = nextPoint;
                break;
            end
        end
        
        if step < eps 
            flgEndSearch = true;
        else        
            if ~flgSuccess
                step = step * alpha;
            end
        end
    end
    
    minPoint = curPoint;
    minValue = curValue;
end

