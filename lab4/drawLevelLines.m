function [] = drawLevelLines(drawedFunc, minX, maxX, minY, maxY, linesCount)
    [x,y] = meshgrid(minX:0.1:maxX, minY:0.1:maxY);
    z = drawedFunc(x,y);
    contour(x, y, z, linesCount);
    colorbar;
end

