function [minPoint, minValue, count] = deformedSimplexMethod(func, ...
        startPoint, edgeLength, eps1, eps2, alpha, gamma, betta, ...
        recoverySteps, maxIterationsCount)
    count = 0;
    
    simplex = getRegularSimplex(startPoint, edgeLength);
    [functionValues, count] = getFunctionValues(func, simplex, count);
    
    flgEndSearch = false;
    flgLastIteration = false;
    iteration = 0;
    stepsCount = 0;
    while ~flgEndSearch
        if iteration > maxIterationsCount
            break;
        else
            iteration = iteration + 1;
        end
        
        if stepsCount > recoverySteps
            drawSimplex(simplex);
            [simplex, functionValues, count] = relaxSimplex(func, simplex, functionValues, count);             
            stepsCount = 0;
        else
            stepsCount = stepsCount + 1;
        end
        
        drawSimplex(simplex);
        
        flgFailure = false;
        [fX0, maxPointIndex] = max(functionValues);
        [xc] = getCenterOfGravity(simplex, maxPointIndex);
        
        x0 = simplex(maxPointIndex,:);
        z1 = getZ1(xc, x0, alpha);
        [fZ1, count] = getFunctionValue(func, z1, count);
        if (fZ1 < fX0)
            z2 = getZ2(xc, x0, gamma);
            [fZ2, count] = getFunctionValue(func, z2, count);
            if fZ2 < fZ1
                newPoint = z2;
                newPointValue = fZ2;
            else
                newPoint = z1;
                newPointValue = fZ1;
            end
        else 
            z3 = getZ3(xc, x0, betta);
            [fZ3, count] = getFunctionValue(func, z3, count);
            if fZ3 < fX0
                z4 = getZ4(xc, x0, betta);
                [fZ4, count] = getFunctionValue(func, z4, count);
                if fZ4 < fZ3
                    newPoint = z4;
                    newPointValue = fZ4;
                else
                    newPoint = z3;
                    newPointValue = fZ3;
                end     
            else
                flgFailure = true;
            end
        end
        
        [minValue, minPointIndex] = min(functionValues);
        
        if flgFailure
            minValue = functionValues(minPointIndex);
            simplex = compressRegularSimplex(simplex, minPointIndex);
            edgeLength = edgeLength / 2;
            [functionValues, count] = refreshFunctionValues(simplex, ...
                func, minPointIndex, minValue, count);
        else
            simplex(maxPointIndex, :) = newPoint;
            functionValues(maxPointIndex) = newPointValue;            
        end           
        
        if followingConditionsStop(edgeLength, eps1, functionValues, minPointIndex, eps2)
            if flgLastIteration
                flgEndSearch = true;
            end
            flgLastIteration = true;
        end
    end
    
    [minValue, minPointIndex] = min(functionValues);
    minPoint = simplex(minPointIndex,:);
end

