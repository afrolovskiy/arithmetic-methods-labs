function [xmin, fmin, count] = methodOfNewton(func, xBegin, xEnd, eps)
    h = getH();

    xEnd = xEnd - h;
    xBegin = xBegin + h;
    
    xCur = xBegin;
    
    count = 0;
    [fCur, count] = getFunc(func, xCur, count);
    flgIsMethodRun = true;
    
    [fRight, count] = getFuncRight(func, xCur, h, count);
    [fLeft, count] = getFuncLeft(func, xCur, h, count);
    
    firstDerivative = getFirstDerivative(fLeft, fRight, h);
    secondDerivative = getSecondDerivative(fLeft, fCur, fRight, h);
    
    while flgIsMethodRun

        alpha = 1.0;
        flgNeededRepeat = true;
        dx = firstDerivative / secondDerivative;
        while flgNeededRepeat    
            xNew  = xCur - alpha * dx;
            [fNew, count] = getFunc(func, xNew, count);
            
            if fNew <= fCur && xNew >= xBegin && xEnd >= xNew
                flgNeededRepeat = false;
            else
                alpha = alpha / 2.0;
            end
        end
        
        [fRight, count] = getFuncRight(func, xNew, h, count);
        [fLeft, count] = getFuncLeft(func, xNew, h, count);    
        
        firstDerivative = getFirstDerivative(fLeft, fRight, h);
        secondDerivative = getSecondDerivative(fLeft, fNew, fRight, h);
        
        if abs(xNew - xCur) < eps
            flgIsMethodRun = false;
        else
            xCur = xNew;
            fCur = fNew;
        end
    end
    
    xmin = xNew;
    fmin = fNew;
end