function [x] = getNewPoint(xc, x0, koeff)
    x = [];
    for j = 1:1:2
        coord = xc(j) + koeff * (xc(j) - x0(j));
        x = [x, coord];
    end
end