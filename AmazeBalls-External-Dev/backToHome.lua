local composer = require( "composer" )
local widget = require("widget")
local scene = composer.newScene()
widget.setTheme ( "widget_theme_ios" )
-- Clear previous scene
--storyboard.removeAll()

display.setDefault( "background", 0, 0, 0 )

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here

-- -------------------------------------------------------------------------------

-- "scene:create()"
function scene:create( event )
    local sceneGroup = self.view
    -- Initialize the scene here.
    -- Example: add display objects to "scenesceneGroup", add touch listeners, etc.
    
end


-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        --purge level
        --storyboard.purgeScene( "Main-Level" )
        --storyboard.removeScene( "Main-Level" )
        --go back to level, by loading it from scratch
        
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        
        local function changeScene ()
            composer.gotoScene( "LevelSelectScene", {effect =  "crossFade", time = 220} )
        end
        
        timer.performWithDelay(150, changeScene, 1)
    end
end

-- "scene:hide()"
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.

    end
end


-- "scene:destroy()"
function scene:destroy( event )

    local sceneGroup = self.view

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
    
end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
 
-- Called when the scene's view does not exist:
function scene:createScene( event )
    local group = self.view
end
 
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
    local group = self.view
    
    --purge level
    --storyboard.purgeScene( "Main-Level" )
    --storyboard.removeScene( "Main-Level" )
    --go back to level, by loading it from scratch
    
    local function changeScene ()
        storyboard.gotoScene( "LevelSelectScene", "fade", 220 )
    end
    
    timer.performWithDelay(150, changeScene, 1)
end
 
-- Called when scene is about to move offscreen:
function scene:exitScene( event )
    local group = self.view
end
 
-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function scene:destroyScene( event )
    local group = self.view
end
 
return scene
--Next-level-reset-level-logic#sthash.aA5LoaL5.dpuf