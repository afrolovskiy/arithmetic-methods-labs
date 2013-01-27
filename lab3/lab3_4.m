% Метод ДФП
fprintf('DFP method\n');

% Функция №1
fprintf('function 1\n');

figure;
hold on;

minX = -5;
maxX = 1;
minY = -2;
maxY = 10;
linesCount = 50;

drawLevelLines(@drawedF1, minX, maxX, minY, maxY, linesCount);

startPoint = [0, sqrt(5)];
eps = 1e-3;
maxIterCount = 4000;

[xmin, fmin, count] = DFPMethod(@f1, startPoint, eps, maxIterCount);
                    
fprintf('x = (%7.4f, %7.4f)\nf(x) = %7.4f\ncount = %d\n', ...
        xmin(1), xmin(2), fmin, floor(count));

printResultToFile('report/dfp_mthd_f1.tex', ...
                  'DFP gradient', xmin, fmin, count);  

% Функция №2
fprintf('function 2\n');

figure;
hold on;

minX = 0;
maxX = 30;
minY = 0;
maxY = 3.5;
linesCount = 50;

drawLevelLines(@drawedF2, minX, maxX, minY, maxY, linesCount);

startPoint = [3, 3];
eps = 1e-3;
maxIterCount = 4000;

[xmin, fmin, count] = DFPMethod(@calcf2, startPoint, eps, maxIterCount);
                   
fprintf('x = (%7.4f, %7.4f)\nf(x) = %7.4f\ncount = %d\n', ...
        xmin(1), xmin(2), fmin, floor(count));

printResultToFile('report/dfp_mthd_f2.tex', ...
                  'DFP gradient', xmin, fmin, count); 
