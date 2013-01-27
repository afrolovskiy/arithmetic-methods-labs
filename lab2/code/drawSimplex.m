function [] = drawSimplex(simplex)
    p1 = simplex(1, :);
    p2 = simplex(2, :);
    p3 = simplex(3, :);
    drawLine(p1, p2);
    drawLine(p2, p3);
    drawLine(p3, p1);
end

