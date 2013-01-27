function [uniformVector] = generateUniformVector(n)
    uniformVector = [];
    normalVector = randn(1, n);
    length = calcVectorLength(normalVector, n);
    for j = 1:1:n
        uniformVector = [uniformVector, normalVector(j) / length];
    end
end

