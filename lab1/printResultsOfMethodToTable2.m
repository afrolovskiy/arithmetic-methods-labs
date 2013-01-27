function [] = printResultsOfMethodToTable2(FID, method, func, methodName, xBegin, xEnd, eps)
    [xmin, fmin, count] = method(func, xBegin, xEnd, eps);
    fprintf(FID, '%s & %5d & %15.10f & %15.10f \\\\ \n \\hline \n', methodName, count, xmin, fmin);    
end

