function [value] = finalBarierFunction(Bk, x)
    if g1(x) >= 0 || g2(x) >= 0 || g3(x) >= 0
        value = realmax;
    else
        value = Bk * (barierFunction(@g1, 1, x) + ...
                      barierFunction(@g2, 1, x) + ...
                      barierFunction(@g3, 1, x));
    end
end

