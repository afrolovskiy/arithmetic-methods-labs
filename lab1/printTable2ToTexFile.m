function [] = printToTable2ToTexFile(fid, xBegin, xEnd, eps)
    fprintf(fid, '\\begin{table}[h]\n');
    fprintf(fid, '\\caption{%s}\n', native2unicode('������� �������'));
    fprintf(fid, '\\begin{tabular}');
    fprintf(fid, '{|p{5cm}|p{3cm}|');
    fprintf(fid,   'p{4cm}|p{4cm}|');
    fprintf(fid,   '}\\hline \n');

    % ��������� �������
    fprintf(fid, ' %s & %s & x* & f(x*) \\\\ \n \\hline \n', ...
        native2unicode('�����'), ...
        native2unicode('���������� ���������� �������'));    
    
    % ���� �������
    printResultsOfMethodToTable2(fid, @bitSearch, @f, ...
        native2unicode('����������� �����'), xBegin, xEnd, eps);
    printResultsOfMethodToTable2(fid, @goldSection, @f, ...
       native2unicode('������� �������'), xBegin, xEnd, eps);
    printResultsOfMethodToTable2(fid, @quadraticInterpolation, @f, ...
        native2unicode('������������ ������������ � ��������� � ������� �������� �������'), xBegin, xEnd, eps);
    printResultsOfMethodToTable2(fid, @methodOfNewton, @f, ...
        native2unicode('���������������� ����� �������'), 0.4, 0.7, eps); %hacking hard code 

    fprintf(fid, '\\end{tabular}\n');
    fprintf(fid, '\\end{table}\n');  
end

