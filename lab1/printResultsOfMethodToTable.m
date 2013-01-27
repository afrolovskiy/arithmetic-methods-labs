function [] = printResultsOfMethodToTable(fid, N, method, ...
                                          func, xBegin, xEnd, eps)
    [xmin, fmin, count] = method(func, xBegin, xEnd, eps);
    fprintf(fid, '%3d & %15.10f & %5d & %15.10f & %15.10f \\\\', ...
        N, eps, count, xmin, fmin);    
    fprintf(fid, '\\hline \n');
end

