function [xmin, fmin, count] = DFPMethod(func, startPoint, eps, maxIterationCount)
    count = 0;
    startAlpha = -10;
    endAlpha = 10;
    
    h = getH();
    
    A = [0 0; 0 0];
    B = [0 0; 0 0];
    H = [1 0; 0 1];
    lastX = startPoint;
    curX = lastX;
        
    f1 = func(lastX);
    f2 = func(lastX + h * [1, 0]);
    f3 = func(lastX + h * [0, 1]);
    count = count + 3;
    
    lastW(1) = calcFirstDerivative(f1, f2, h);
    lastW(2) = calcFirstDerivative(f1, f3, h);
    lastW = -lastW;
    
    p = [0 0];
        
    % other iterations
    flgEndSearch = false;
    while ~flgEndSearch
        p = H * transpose(lastW);
        
        fi = @(alpha)(func(lastX + alpha * transpose(p)));
        [alpha, fmin, tmp, output] =  fminbnd(fi, startAlpha, endAlpha, optimset('TolX', 1e-6));
        count1 = output.funcCount;
        count = count + count1;  
        curX = lastX + alpha * transpose(p);
        
        f1 = func(curX);
        f2 = func(curX + h * [1, 0]);
        f3 = func(curX + h * [0, 1]);
        count = count + 3;

        curW(1) = calcFirstDerivative(f1, f2, h);
        curW(2) = calcFirstDerivative(f1, f3, h);
        curW = -curW;
        
        drawLine(curX, lastX);
        
        if norm(curW) < eps
            break;
        end
        
        v = transpose(curX - lastX);
        u = transpose(curW - lastW);
        
        A = v * transpose(v) ./ sum(u .* v);
        B = (H * u * transpose(u) * transpose(H)) / sum((H * u) .* u);
        
        H = H - A - B;
        
        lastX = curX;
        lastW = curW;
    end
    
    xmin = curX;
    fmin = f1;
end

