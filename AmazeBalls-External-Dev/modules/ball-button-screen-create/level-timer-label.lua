local levelTimerLabel = function (levelTimeString)
    local levelTimerLabel = display.newImageRect("images/central-images/Layout/levelTimerDisplay.png", 74, 40)
    --mapShowAndClockLabel:setReferencePoint( display.CenterReferencePoint )
    levelTimerLabel.anchorX = 0
    levelTimerLabel.anchorY = 0
    levelTimerLabel.x = -9
    levelTimerLabel.y = -7
    levelTimerLabel.name = "levelTimerLabel"
    levelTimerLabel.text = display.newText(levelTimeString, 0, 0, nil, 13)
    levelTimerLabel.text.x = levelTimerLabel.x + 39
    levelTimerLabel.text.y = levelTimerLabel.y + 20
    levelTimerLabel.text:setTextColor(150, 30, 120)
    levelTimerLabel.text.alpha = 1

    return levelTimerLabel;
end;

return levelTimerLabel;