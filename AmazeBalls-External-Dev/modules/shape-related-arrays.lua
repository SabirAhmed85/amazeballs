local t = {}

local directionArray = {
    "up",
    "right",
    "down",
    "left"
}
t.directionArray = directionArray

-- local hW = (28/60) * ( (display.contentWidth * (9/10)) / 13 ) -- tablet
-- local hH = (24/52) * ( (display.contentHeight * (13/16)) / 9 ) -- tablet
local hW = (28/60) * ( (display.contentWidth * (7/8)) / 7 )
local hH = (24/52) * ( (display.contentHeight * (13/16)) / 5 )

local hW2 = hW * 2
local hH2 = hH * 2
local barW = hW/6
local doubleBarW = hW/3

local gunH = hH / 2
local gunW = (hW * 2) / 3

local shapeFormingArray = {
    {"triangleTopLeftShape", {hW,-hH, hW, hH, -hW, hH}, {-hW,-hH, hW, hH, -hW, hH}, {hW, -hH, hH, hH, -hH, -hH}, 1},
    {"triangleTopRightShape", {-hW, -hH, hW, hH, -hW, hH}, {hW, -hH, hW, hH, -hW,hH}, {hW,-hH, -hW,hH, -hW,-hH}, 2},
    {"triangleBottomRightShape", {-hW,-hH, hW, -hH, -hW, hH}, {-hW, -hH, hW, -hH, hW, hH}, {-hW, -hH, hW, hH, -hW,hH}, 3},
    {"triangleBottomLeftShape", {-hW,-hH, hW, -hH, hW, hH}, {-hW,-hH, hW,-hH, -hW,hH}, {hW,-hH, hW,hH, -hW,hH}, 4},
    {"triangleLeftAndRightShape", { -hW,-hH2, hW,0, -hW,hH2 }, { hW,hH2, -hW,0, hW,-hH2 }, { hW,hH2, -hW,0, hW,-hH2 }, 5},
    {"triangleTopAndBottomShape", { -hW2,hH, 0,-hH, hW2,hH }, { 0,hH, -hW2,-hH, hW2,-hH }, { 0,hH, -hW2,-hH, hW2,-hH }, 6},
    {"bar", { -barW, -hH, barW,-hH, barW, hH, -barW, hH }, 7 },
    {"doubleBar", { -barW, -hH2, barW,-hH2, barW, hH2, -barW, hH2 }, 7 },
    {"square", { -hW, -hH, hW,-hH, hW, hH, -hW, hH }, 7},
    {"gun", { -gunW, -gunH, gunW, -gunH, gunW, gunH, -gunW, gunH }, 7}
}
t.shapeFormingArray = shapeFormingArray

return t
