function [points] = calcPoints(curPoint, n, step, vectors, attemptsCount);
    points = [];
    for i = 1:1:attemptsCount
        uniformVector = vectors(i, :);
        points = [points; calcNextPoint(curPoint, uniformVector, step, n)];
    end
end

