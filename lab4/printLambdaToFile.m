function [] = printLambdaToFile(filename, lambda)
    fid = fopen(filename, 'w', 'n', 'UTF-8');
    fprintf(fid, '%7.4f', lambda);    
    fclose(fid);
end

