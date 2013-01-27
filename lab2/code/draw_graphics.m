% Рисование графика функции №2
% Обычной функции
figure;
hold on;

title('simple function 2 in 3D');
[x,y] = meshgrid(0.01:0.01:25, 0.01:0.01:3.5);
z = graphic_f2(x,y);
[C, h] = contour3(x, y, z, 100);

figure;
hold on;

title('simple function 2 in 2D');
[x,y] = meshgrid(0.01:0.01:25, 0.01:0.01:3.5);
z = graphic_f2(x,y);
[C, h] = contour3(x, y, z, 100);

% Доопределенной функции
figure;
hold on;

title('overdefined function 2 in 3D');
set(gca, 'Clim', [0 1e3])
drawLevelLines3D(@drawedF2, 0, 25, 0, 3.5, 100);

figure;
hold on;

title('overdefined function 2 in 2D');
drawLevelLines(@drawedF2, 0, 25, 0, 3.5, 100);