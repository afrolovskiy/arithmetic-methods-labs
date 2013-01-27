% Поиск минимума стандартными средствами для доопрелеленной функции
fprintf('standart method\n');

% Функция №1
fprintf('\nfunction 1\n');
[xmin, fmin, tmp, output] = fminsearch(@f1, [3 3], ...
                                       optimset('TolX', 1e-3));
count = output.funcCount;
fprintf('x = (%7.4f, %7.4f)\nf(x) = %7.4f\ncount = %d\n', ...
        xmin(1), xmin(2), fmin, floor(count));

printResultToFile('report/standart_mthd_f1.tex','Standart', ...
                  xmin, fmin, count);    
    
% Функция №2
fprintf('\nfunction 2\n');
[xmin,fmin, tmp, output] = fminsearch(@calcf2, [3 3], ...
                                      optimset('TolX', 1e-3));
count = output.funcCount;
fprintf('x = (%7.4f, %7.4f)\nf(x) = %7.4f\ncount = %d\n', ...
        xmin(1), xmin(2), fmin, floor(count));

printResultToFile('report/standart_mthd_f2.tex','Standart', ...
                  xmin, fmin, count);    
