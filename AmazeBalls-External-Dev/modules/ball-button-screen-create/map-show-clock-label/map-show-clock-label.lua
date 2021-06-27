local mapShowAndClockLabel = function ()
    local mapShowAndClockLabel = display.newImageRect("images/central-images/Layout/levelTimerDisplay.png", 74, 40)
    --mapShowAndClockLabel:setReferencePoint( display.CenterReferencePoint )
    mapShowAndClockLabel.anchorX = 0
    mapShowAndClockLabel.anchorY = 0
    mapShowAndClockLabel.yScale = -1
    mapShowAndClockLabel.x = -17
    mapShowAndClockLabel.y = display.contentHeight + 7
    mapShowAndClockLabel.name = "mapShowAndClockLabel"
    mapShowAndClockLabel.alpha = 0

    return mapShowAndClockLabel;
end;

return mapShowAndClockLabel;