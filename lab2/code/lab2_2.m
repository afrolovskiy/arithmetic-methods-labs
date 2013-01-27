% Метод случайного поиска с возратом
fprintf('Random backtracking method\n');

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
eps = 1e-3;
step = 0.5;
maxAttemptsCount = 10;
n = 2;
maxIterCount = 4000;
alpha = 0.5;

[xmin, fmin, count] = randomBacktrackingMethod(@f1, startPoint, step, ...
                            alpha, maxAttemptsCount, eps, n, maxIterCount);

fprintf('\nfunction 1\n');
fprintf('x = (%7.4f, %7.4f)\nf(x) = %7.4f\ncount = %d\n', ...
        xmin(1), xmin(2), fmin, floor(count));

printResultToFile('report/rand_back_mthd_f1.tex', ...
                  'Random bactracking', xmin, fmin, count);    
    
% Функция №2
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
step = 2.0;
maxAttemptsCount = 10;
n = 2;
maxIterCount = 4000;
alpha = 0.5; 

[xmin, fmin, count] = randomBacktrackingMethod(@calcf2, startPoint, ...
                            step, alpha, maxAttemptsCount, eps, n, ...
                            maxIterCount);

fprintf('\nfunction 2\n');
fprintf('x = (%7.4f, %7.4f)\nf(x) = %7.4f\ncount = %d\n', ...
        xmin(1), xmin(2), fmin, floor(count));

printResultToFile('report/rand_back_mthd_f2.tex', ...
                  'Random backtracking', xmin, fmin, count);    