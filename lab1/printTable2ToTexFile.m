function [] = printToTable2ToTexFile(fid, xBegin, xEnd, eps)
    fprintf(fid, '\\begin{table}[h]\n');
    fprintf(fid, '\\caption{%s}\n', native2unicode('Сводная таблица'));
    fprintf(fid, '\\begin{tabular}');
    fprintf(fid, '{|p{5cm}|p{3cm}|');
    fprintf(fid,   'p{4cm}|p{4cm}|');
    fprintf(fid,   '}\\hline \n');

    % заголовок таблицы
    fprintf(fid, ' %s & %s & x* & f(x*) \\\\ \n \\hline \n', ...
        native2unicode('Метод'), ...
        native2unicode('Количество вычислений функции'));    
    
    % тело таблицы
    printResultsOfMethodToTable2(fid, @bitSearch, @f, ...
        native2unicode('поразрядный поиск'), xBegin, xEnd, eps);
    printResultsOfMethodToTable2(fid, @goldSection, @f, ...
       native2unicode('золотое сечение'), xBegin, xEnd, eps);
    printResultsOfMethodToTable2(fid, @quadraticInterpolation, @f, ...
        native2unicode('квадратичная интерполяция в сочетании с методом золотого сечения'), xBegin, xEnd, eps);
    printResultsOfMethodToTable2(fid, @methodOfNewton, @f, ...
        native2unicode('модифицированный метод Ньютона'), 0.4, 0.7, eps); %hacking hard code 

    fprintf(fid, '\\end{tabular}\n');
    fprintf(fid, '\\end{table}\n');  
end

