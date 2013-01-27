function [vectors] = generateUniformVectors(n, vectorsCount)
    vectors = [];
    for i = 1:1:vectorsCount
       vectors = [vectors; generateUniformVector(n)]; 
    end
end

