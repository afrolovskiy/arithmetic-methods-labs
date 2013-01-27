function [length] = calcVectorLength(vector, n)
    sum = 0;
    for j = 1:1:n
        sum = sum + vector(j)^2;
    end            
    length = sqrt(sum);    
end

