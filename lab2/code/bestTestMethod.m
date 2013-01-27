function [minPoint, minValue, count] = bestTestMethod(func, startPoint, step, alpha, attemptsCount, eps, n, maxIterationsCount)
    count = 0;
    curPoint = startPoint;
    curValue = func(curPoint); count = count + 1;
    flgEndSearch = false;
    iteration = 0;
    while ~flgEndSearch        
        if iteration > maxIterationsCount
            break;
        else
            iteration= iteration + 1;
        end
        
        vectors = generateUniformVectors(n, attemptsCount);
        
        points = calcPoints(curPoint, n, step, vectors, attemptsCount);
        % draw all new points
        %for i = 1:1:attemptsCount
        %    drawLine(curPoint, points(i, :));
        %end
        
        [values, count] = calcFuncValues(func, points, attemptsCount, count);
        [nextValue, minIndex] = min(values);
        nextPoint = points(minIndex, :);
        
        if nextValue < curValue
            drawLine(curPoint, nextPoint);
            curValue = nextValue;
            curPoint = nextPoint;
        else
            if step <= eps 
                flgEndSearch = true;
            else
                step = alpha * step;
            end
        end        
    end
    
    minPoint = curPoint;
    minValue = curValue;
end

