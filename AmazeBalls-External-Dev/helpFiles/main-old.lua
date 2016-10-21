-- 
-- Abstract: JungleScene sample project
-- Demonstrates sprite sheet animations, with different frame rates
-- 
-- Version: 1.0
-- 
-- Sample code is MIT licensed, see http://www.coronalabs.com/links/code/license
-- Copyright (C) 2010 Corona Labs Inc. All Rights Reserved.

-- Plants are from http://blender-archi.tuxfamily.org/Greenhouse
-- and are subject to creative commons license, http://creativecommons.org/licenses/by/3.0/

display.setStatusBar( display.HiddenStatusBar )

-- The sky as background
local sky = display.newImage( "sky.jpg" )

local baseline = 280

local widget = require "widget"

local playBtn

-- a bunch of foliage
local tree = {}
tree[1] = display.newImage( "Palm-arecaceae.png" )
tree[1].xScale = 0.7; tree[1].yScale = 0.7
tree[1]:setReferencePoint( display.BottomCenterReferencePoint )
tree[1].x = 20; tree[1].y = baseline
tree[1].dx = 0.1
tree[2] = display.newImage( "Greenhouse-Palm-jubaea01.png" )
tree[2].xScale = 0.6; tree[2].yScale = 0.6
tree[2]:setReferencePoint( display.BottomCenterReferencePoint )
tree[2].x = 120; tree[2].y = baseline
tree[2].dx = 0.2
tree[3] = display.newImage( "Greenhouse-Palm-cycas01.png" )
tree[3].xScale = 0.8; tree[3].yScale = 0.8
tree[3]:setReferencePoint( display.BottomCenterReferencePoint )
tree[3].x = 200; tree[3].y = baseline
tree[3].dx = 0.3
tree[4] = display.newImage( "Ginger.png" )
tree[4].xScale = 0.7; tree[4].yScale = 0.7
tree[4]:setReferencePoint( display.BottomCenterReferencePoint )
tree[4].x = baseline; tree[4].y = baseline
tree[4].dx = 0.4
tree[5] = display.newImage( "Greenhouse-Palm-acai01.png" )
tree[5].xScale = 0.8; tree[5].yScale = 0.8
tree[5]:setReferencePoint( display.BottomCenterReferencePoint )
tree[5].x = 300; tree[5].y = baseline
tree[5].dx = 0.5
tree[6] = display.newImage( "Dracena.png" )
tree[6].xScale = 0.4; tree[5].yScale = 0.4
tree[6]:setReferencePoint( display.BottomCenterReferencePoint )
tree[6].x = 320; tree[6].y = baseline
tree[6].dx = 0.6
tree[7] = display.newImage( "Banana.png" )
tree[7].xScale = 0.4; tree[7].yScale = 0.4
tree[7]:setReferencePoint( display.BottomCenterReferencePoint )
tree[7].x = 380; tree[7].y = baseline
tree[7].dx = 0.7
tree[8] = display.newImage( "Bamboo-rgba.png" )
tree[8].xScale = 0.8; tree[8].yScale = 0.8
tree[8]:setReferencePoint( display.BottomCenterReferencePoint )
tree[8].x = 420; tree[8].y = baseline
tree[8].dx = 0.8

-- A sprite sheet with a green dude
local sheet2 = graphics.newImageSheet( "greenman.png", { width=128, height=128, numFrames=15 } )

-- play 15 frames every 500 ms
local instance2 = display.newSprite( sheet2, { name="man", start=1, count=15, time=500 } )
instance2.x = 1 * display.contentWidth / 4 + 90
--1 * display.contentWidth / 4 + 90
instance2.y = baseline - 55

-- A sprite sheet with a green dude backwards
local sheet1 = graphics.newImageSheet( "greenmanBack.png", { width=128, height=128, numFrames=15, frames = {15,14,13,12,11,10,9,8,7,6,5,4,3,2,1} } )

-- play 15 frames every 500 ms
local instance1 = display.newSprite( sheet1, { name="manBack", start=1, count=15, time=650 } )
instance1.x = 9000
instance1.y = baseline - 55


-- Grass
-- This is doubled so we can slide it
-- When one of the grass images slides offscreen, we move it all the way to the right of the next one.
local grass = display.newImage( "grass.png" )
grass:setReferencePoint( display.CenterLeftReferencePoint )
grass.x = 0
grass.y = baseline - 20
local grass2 = display.newImage( "grass.png" )
grass2:setReferencePoint( display.CenterLeftReferencePoint )
grass2.x = 480
grass2.y = baseline - 20

-- solid ground, doesn't need to move
local ground = display.newRect( 0, baseline, 480, 90 )
ground:setFillColor( 0x31, 0x5a, 0x18 )

-- A per-frame event to move the elements
local tPrevious = system.getTimer()

local animDirection = 1

local playCounter = 0
local tPause
local tReplay
local pauseLength

local yOffset
local tJump
local tJumptime

local dropCounter = 0

local ground = instance2.y

local function jumpMan(event)
    tDeltaJump = event.time - tJump
    tJump = event.time
    yOffset = ( 0.25 * tDeltaJump )
    
        instance2.y = instance2.y - yOffset
        instance1.y = instance1.y - yOffset

        return true
        
end

local function dropMan(event)
            if (instance2.y) < ground then 
                instance2.y = instance2.y + 10
                instance1.y = instance1.y + 10
            end
            
        return true
end

local function move(event)
        
        local tDelta;
        
        if (functionCounter) == 0 then
            tDelta = event.time - tPrevious - pauseLength
        else
            tDelta = event.time- tPrevious
        end
        
        tPrevious = event.time
        
        local animationSpeed = 0.25
        
        local xOffset = ( animationSpeed * tDelta );
        
        if (functionTimer) < 20 then
            xOffset = ( 0.25 * tDelta )
        else
            xOffset = ( 0.25 * tDelta )
        end
        
        xOffset = xOffset * animDirection

	grass.x = grass.x - xOffset
	grass2.x = grass2.x - xOffset
        
        if (animDirection) == 1 then
	
            if (grass.x + grass.contentWidth) < 0 then
                    grass:translate( 480 * 2, 0)
            end
            if (grass2.x + grass2.contentWidth) < 0 then
                    grass2:translate( 480 * 2, 0)
            end
            
            local i
            for i = 1, #tree, 1 do
                    tree[i].x = tree[i].x - tree[i].dx * tDelta * 0.2
                    if (tree[i].x + tree[i].contentWidth) < 0 then
                            tree[i]:translate( 480 + tree[i].contentWidth * 2, 0 )
                    end
            end
        
    else
        
        if (grass.x + grass.contentWidth) > 480 * 2 then
		grass:translate( -480 * 2, 0)
	end
	if (grass2.x + grass2.contentWidth) > 480 * 2 then
		grass2:translate( -480 * 2, 0)
	end
	
	local i
	for i = 1, #tree, 1 do
		tree[i].x = tree[i].x + tree[i].dx * tDelta * 0.2
		if (tree[i].x + tree[i].contentWidth) > 480 + tree[i].contentWidth * 2 then
			tree[i]:translate( -480 - tree[i].contentWidth * 2, 0 )
		end
	end
        
    end
        
        functionCounter = functionCounter + 1
        functionTimer =functionTimer + 1
        
end

local function listener(event) 
  	if event.phase == "began" then
	    tReplay = system.getTimer()
            pauseLength = tReplay - tPause
            animDirection = 1
            instance1.x = 9000
            instance2.x = 1 * display.contentWidth / 4 + 90
            instance2:play()
            instance1:pause()
            playCounter = 1
            functionCounter = 0
            functionTimer = 0
            Runtime:addEventListener( "enterFrame", move )
            Runtime:removeEventListener( "enterFrame", dropMan )
        
	elseif event.phase == "ended" then
	    tPause = system.getTimer()
            instance2:pause()
            playCounter = 0
            Runtime:removeEventListener( "enterFrame", move )
        -- instance2.y = baseline - 205
	end
	return true
end

local function listenerBack(event) 
  	if event.phase == "began" then
	    tReplay = system.getTimer()
            pauseLength = tReplay - tPause
            animDirection = -1
            instance2.x = 9000
            instance1.x = 1 * display.contentWidth / 4 + 90
            instance1:play()
            playCounter = 1
            functionCounter = 0
            functionTimer = 0
            Runtime:addEventListener( "enterFrame", move )
            Runtime:removeEventListener( "enterFrame", dropMan )
        
	elseif event.phase == "ended" then
	    tPause = system.getTimer()
            instance1:pause()
            playCounter = 0
            Runtime:removeEventListener( "enterFrame", move )
        -- instance2.y = baseline - 205
	end
	return true
end

local function listenerJump(event)
    if event.phase == "began" then
            tJump = system.getTimer()
            Runtime:addEventListener( "enterFrame", jumpMan )
            Runtime:removeEventListener( "enterFrame", dropMan )
	elseif event.phase == "ended" then
            tDrop = system.getTimer()
            Runtime:removeEventListener( "enterFrame", jumpMan )
            Runtime:addEventListener( "enterFrame", dropMan )
            tNow = event.time - tDrop
            if (tNow) == 200 then
                Runtime:removeEventListener( "enterFrame", dropMan )
            end
        -- instance2.y = baseline - 205
	end
	return true
end

playBtn = widget.newButton{
		label=">",
		labelColor = { default={255}, over={128} },
		default="button.png",
		over="button-over.png",
		width=30, height=40,
		onRelease = onPlayBtnRelease	-- event listener function
	}
	playBtn:setReferencePoint( display.CenterReferencePoint )
	playBtn.x = 55
	playBtn.y = display.contentHeight - 25
        
backBtn = widget.newButton{
		label="<",
		labelColor = { default={255}, over={128} },
		default="button.png",
		over="button-over.png",
		width=30, height=40,
		onRelease = onBackBtnRelease	-- event listener function
	}
	backBtn:setReferencePoint( display.CenterReferencePoint )
	backBtn.x = 20
	backBtn.y = display.contentHeight - 25
        
jumpBtn = widget.newButton{
		label="J",
		labelColor = { default={255}, over={128} },
		default="button.png",
		over="button-over.png",
		width=30, height=40,
		onRelease = onJumpBtnRelease	-- event listener function
	}
	jumpBtn:setReferencePoint( display.CenterReferencePoint )
	jumpBtn.x = display.contentWidth - 20
	jumpBtn.y = display.contentHeight - 25
        
playBtn:addEventListener( "touch", listener )
backBtn:addEventListener( "touch", listenerBack )
jumpBtn:addEventListener( "touch", listenerJump )

-- Start everything moving
-- Runtime:addEventListener( "enterFrame", move);