local gemCounter_FirstDigit = function (initial, digit, showGemsLabelX, showGemsLabelY)
    local gemCounter_FirstDigit = display.newImage("images/objects/imageNumber".. digit ..".png")
    --gemCounter_FirstDigit:setReferencePoint(display.BottomLeftReferencePoint);
    gemCounter_FirstDigit.anchorX = 0
    gemCounter_FirstDigit.anchorY = 1
    gemCounter_FirstDigit.x = showGemsLabelX + 30
    gemCounter_FirstDigit.y = initial and showGemsLabelY - 4 or -10;
    gemCounter_FirstDigit.xScale = 0.5
    gemCounter_FirstDigit.yScale = 0.5;

    if (initial) then
        gemCounter_FirstDigit.alpha = 0
    else
        gemCounter_FirstDigit:toFront()
    end

    return gemCounter_FirstDigit;
end;

return gemCounter_FirstDigit;