function [leftX, leftY, middleX, middleY, rightX, rightY,  count] = goldSectionPart(func, xBegin, xEnd, eps, maxStepCount, count)
    a = xBegin;
    b = xEnd;
    h = b - a;
    
    leftX = a;
    rightX = b;
    
    tau = getTau();
   
    x1 = b - tau*h;  
    f1 = func(x1); count = count + 1;
    
    x2 = a + tau*h;  
    f2 = func(x2); count = count + 1;
    
    stepCount = 0;
    isUnknownLeftY = true;
    isUnknownRightY = true;
    while (stepCount < maxStepCount) && (abs(b - a) >= eps)
        if (f1 < f2) 
            middleX = x1;
            middleY = f1;
            
            isUnknownLeftY = true;
            isUnknownRightY = false;
            rightY = f2;
            
            b = x2;
            x2 = x1;
            f2 = f1; 
            x1 = b - tau*(b - a);
            f1 = func(x1); count = count + 1;
        else
            middleX = x2;
            middleY = f2;
            
            isUnknownLeftY = false;
            isUnknownRightY = true;
            leftY = f1;
            
            a = x1;
            x1 = x2;
            f1 = f2;
            x2 = a + tau*(b - a);
            f2 = func(x2); count = count + 1;
        end
        stepCount = stepCount + 1;
    end    
    
    if isUnknownLeftY
        leftY = f(a); count = count + 1;
    end
    
    if isUnknownRightY
        rightY = f(b); count = count + 1;
    end
    
    leftX = a;
    rightX = b;
end