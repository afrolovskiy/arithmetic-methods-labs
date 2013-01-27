function [] = printTableForMethodToTexFile(fid, method, methodName, func, ...
                                           xBegin, xEnd, startEps, finishEps)
    fprintf(fid, '\n\\begin{table}[h]\n');
    fprintf(fid, '\\caption{%s}\n', methodName);
    fprintf(fid, '\\centering\n');
   
    % описание таблицы
    fprintf(fid, '\\begin{tabular}');
    fprintf(fid, '{| c | c |');
    fprintf(fid,   ' c | c |');
    fprintf(fid,   ' c |} \\hline \n');

    % заголовок таблицы
    fprintf(fid, ' N & %s & %s & x* & f(x*) \\\\ \n \\hline \n', ...
        native2unicode('Заданная точность'), ...
        native2unicode('Количество вычислений функции'));
    
    % тело таблицы
    eps = startEps;
    N = 1;
    while eps >= finishEps
        printResultsOfMethodToTable(fid, N, method, ...
                                    func, xBegin, xEnd, eps);
        eps = eps / 10;
        N = N + 1;
    end
   
    fprintf(fid, '\\end{tabular}\n');
    fprintf(fid, '\\end{table}\n'); 
end

