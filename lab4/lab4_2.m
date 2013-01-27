% Метод барьерных функций
figure;
hold on;

minX = -5;
maxX = 1;
minY = -2;
maxY = 10;
linesCount = 50;

drawLevelLines(@drawedF1, minX, maxX, minY, maxY, linesCount);

% g1(x)
x1(1) = -5;
x1(2) = -0.8 * x1(1);

x2(1) = 0;
x2(2) = -0.8 * x2(1);

drawLine(x1, x2, 'k');

% g2(x)
y = -3:0.1:3;
x = -y.^2;

plot(x, y, 'k');

% g3(x)
x1(1) = -5;
x1(2) = -26 - 6 * x1(1);

x2(1) = 1;
x2(2) = -26 - 6 * x2(1);

drawLine(x1, x2, 'k');

[xmin, fmin, count, iterations] = barierFunctionMethod(@f1, [-2 0], ...
                                        2, 25, 1e-4, 8000); %20, 10

fprintf('x = (%7.4f, %7.4f)\nf(x) = %7.4f\ncount = %d\n', ...
        xmin(1), xmin(2), fmin, floor(count));
fprintf('iterations: %d\n', iterations);
lambda2_1 = lambda1(xmin);
fprintf('lamdba2 = %7.4f\n', lambda2_1);
lambda2_2 = lambda2(xmin);
fprintf('lamdba2 = %7.4f\n', lambda2_2);

printLambdaToFile('report/lambda2_1_barier.tex', lambda2_1); 
printLambdaToFile('report/lambda2_2_barier.tex', lambda2_2); 
printResultToFile('report/barier_func_f1.tex', ...
                  'Barier functions', xmin, fmin, count);  