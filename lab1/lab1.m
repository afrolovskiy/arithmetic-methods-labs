eps = 1e-2;
xBegin = 0.0;
xEnd = 1.0;

xmin = fminbnd(@f, xBegin, xEnd)
fmin = f(xmin)
[xmin, fmin, count] = bitSearchStepByStep(@f, 0.0, 1.0, eps)
[xmin, fmin, count] = goldSectionStepByStep(@f, 0.0, 1.0, eps)
[xmin, fmin, count] = quadraticInterpolationStepByStep(@f, 0.0, 1.0, eps)
[xmin, fmin, count] = methodOfNewtonStepByStep(@f, 0.3, 0.7, eps)
