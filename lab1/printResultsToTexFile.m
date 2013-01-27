function [] = printResultsToTexFile()
    %slCharacterEncoding('UTF-8');
    fid = fopen('report/tables.tex', 'w', 'n', 'UTF-8');
    printTablesToTexFile(fid, 0.0, 1.0, 1e-2, 1e-6); 
    printTable2ToTexFile(fid, 0.0, 1.0, 1e-6);
    fclose(fid);
end

