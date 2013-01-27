function [minPoint, minValue, count] = regularSimplexMethod(f, ...
        startPoint, edgeLength, alpha, eps1, eps2, maxIterationsCount)
    count = 0;
    
    simplex = getRegularSimplex(startPoint, edgeLength);    
    [functionValues, count] = getFunctionValues(f, simplex, count);
    
    
    flgEndSearch = false;
    flgLastIteration = false;
    iteration = 0;
    while ~flgEndSearch        
        if iteration > maxIterationsCount
            break;
        else
            iteration = iteration + 1;
        end            
        
        drawSimplex(simplex);
        
        [maxValue, maxPointIndex] = max(functionValues);
        reflectedSimplex = reflectRegularSimplex(simplex, maxPointIndex);
                        
        newPoint = reflectedSimplex(maxPointIndex,:);
        [newPointValue, count] = getFunctionValue(f, newPoint, count);
        
        if newPointValue >= maxValue       
            [minValue, minPointIndex] = min(functionValues); 
            simplex = compressRegularSimplex(simplex, minPointIndex);
            edgeLength = alpha * edgeLength;            
            [functionValues, count] = refreshFunctionValues(simplex, f, ...
                minPointIndex, minValue, count);
        else
            simplex = reflectedSimplex;
            functionValues(maxPointIndex) = newPointValue;
        end
        
        [minValue, minPointIndex] = min(functionValues); 
        
        if followingConditionsStop(edgeLength, eps1, functionValues, ...
                minPointIndex, eps2)
            if ~flgLastIteration
                flgLastIteration = true;
            else
                flgEndSearch = true;
            end
        end
    end
    
    minPoint = simplex(minPointIndex,:);
    [minValue, minPointIndex] = min(functionValues);
end

