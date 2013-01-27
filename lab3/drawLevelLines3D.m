function [C, h] = drawLevelLines3D(drawedFunc, minX, maxX, minY, maxY, linesCount)
    [x,y] = meshgrid(minX:0.1:maxX, minY:0.1:maxY);
    z = drawedFunc(x,y);
    [C, h] = contour3(x, y, z, linesCount);
    colorbar;
end

