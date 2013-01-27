function [topX, topY, count] = getTop(func, x1, x2, x3, f1, f2, f3, count)
    [a, b, c] = calculateKoefficients(x1, x2, x3, f1, f2, f3);
    topX = -b / (2 * a);
    topY = func(topX); count = count + 1;
end