% my function
function [y] = f(x)
	y = cos((2 .* x.^3 - 3 .* x + 3 + 3 * sqrt(10)) ./ 3) + asin((x.^3 + 2 .* x + 1) ./ (3 .* x + 1)) - 0.5; 
end

