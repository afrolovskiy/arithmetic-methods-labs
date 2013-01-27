function [] = drawLine(curPoint, nextPoint)
    hold on;
    line([curPoint(1), nextPoint(1)], [curPoint(2), nextPoint(2)]);
end

