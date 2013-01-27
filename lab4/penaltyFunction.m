function [result] = penaltyFunction(g, alpha, x)
    value = g(x);
    if value <= 0
        result = 0;
    else
        result = value;
    end
end

