% Поиск минимума методом регулярного симплекса
fprintf('Regular simplex method\n');

% Функция №1
figure;
hold on;

minX = -5;
maxX = 1;
minY = -2;
maxY = 10;
linesCount = 50;

drawLevelLines(@drawedF1, minX, maxX, minY, maxY, linesCount);

startPoint = [0, sqrt(5)];
edgeLength = 0.5;
eps1 = 1e-3;
eps2 = 1e-3;
alpha = 0.5;
maxIterCount = 1000;

[xmin, fmin, count] = regularSimplexMethod(@f1, startPoint, edgeLength, ...
                            alpha, eps1, eps2, maxIterCount);

fprintf('\nfunction 1\n');
fprintf('x = (%7.4f, %7.4f)\nf(x) = %7.4f\ncount = %d\n', ...
        xmin(1), xmin(2), fmin, floor(count));

printResultToFile('report/regular_simplex_mthd_f1.tex', ...
                  'Regular simplex', xmin, fmin, count);  
              
% Функция №2
figure;
hold on;

minX = 0;
maxX = 25;
minY = 0;
maxY = 5;
linesCount = 50;

drawLevelLines(@drawedF2, minX, maxX, minY, maxY, linesCount);

startPoint = [3, 3];
edgeLength = 2.0;
eps1 = 1e-3;
eps2 = 1e-3;
maxIterCount = 2000;
alpha = 0.5;

[xmin, fmin, count] = regularSimplexMethod(@calcf2, startPoint, ...
                                edgeLength, alpha, eps1, eps2, ...
                                maxIterCount);

fprintf('\nfunction 2\n');
fprintf('x = (%7.4f, %7.4f)\nf(x) = %7.4f\ncount = %d\n', ...
        xmin(1), xmin(2), fmin, floor(count));

printResultToFile('report/regular_simplex_mthd_f2.tex', ...
                  'Regular simplex', xmin, fmin, count);  