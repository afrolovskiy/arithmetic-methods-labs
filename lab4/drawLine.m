function [] = drawLine(curPoint, nextPoint, color)
    line([curPoint(1), nextPoint(1)], [curPoint(2), nextPoint(2)], 'Color', color);
end

