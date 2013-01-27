function [result] = drawedF2(x, y)
    [m, n] = size(x);
    result = zeros(m, n);
    for i = 1:1:m        
        for j = 1:1:n
            result(i,j) = drawf2([x(i,j), y(i,j)]);      
        end
    end
end