function [] = printResultToFile(filename, method, x, f, count)
    fid = fopen(filename, 'w', 'n', 'UTF-8');
    fprintf(fid, '%s & (%7.4f, %7.4f) & %7.4f & %d \\\\', ...
            method, x(1), x(2), f, count);    
        fprintf(fid, '\\hline \n');
    fclose(fid);
end

