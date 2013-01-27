function [reflectedSimplex] = reflectRegularSimplex(simplex, reflectedPointIndex)
    reflectedPoint = getReflectedPoint(simplex, reflectedPointIndex);
    reflectedSimplex = [];
    for i = 1:1:3
        if i == reflectedPointIndex
            reflectedSimplex = [reflectedSimplex; reflectedPoint];
        else
            reflectedSimplex = [reflectedSimplex; simplex(i,:)];
        end
    end
end