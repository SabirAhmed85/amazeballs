local gemCounter_SecondDigit = function (initial, digit, showGemsLabelX, showGemsLabelY)
    local gemCounter_SecondDigit = display.newImage("images/objects/imageNumber".. digit ..".png")
    --gemCounter_SecondDigit:setReferencePoint(display.BottomLeftReferencePoint);
    gemCounter_SecondDigit.anchorX = 0
    gemCounter_SecondDigit.anchorY = 1
    gemCounter_SecondDigit.xScale = 0.5
    gemCounter_SecondDigit.yScale = 0.5
    gemCounter_SecondDigit.x = showGemsLabelX + 40
    gemCounter_SecondDigit.y = initial and showGemsLabelY - 4 or -10;

    if (initial) then
        gemCounter_SecondDigit.alpha = 0
    else
        gemCounter_SecondDigit:toFront()
    end

    return gemCounter_SecondDigit;
end;

return gemCounter_SecondDigit;