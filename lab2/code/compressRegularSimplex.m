function [compressedSimplex] = compressRegularSimplex(simplex, keypointIndex)
    keypoint = simplex(keypointIndex,:);
    compressedSimplex = [];
    for i = 1:1:3
        if i == keypointIndex
            compressedSimplex = [compressedSimplex; keypoint];
        else
            point = simplex(i,:);
            newPoint = [];
            for j = 1:1:2
                newCoordinate = keypoint(j) + (point(j) - keypoint(j)) / 2;
                newPoint = [newPoint, newCoordinate];
            end
            compressedSimplex = [compressedSimplex; newPoint];
        end
    end
end

